// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:towner/models/vechile_model.dart';

class ServiceController extends ChangeNotifier {
  DateTime? _selectedDate;

  DateTime? get selectedDate => _selectedDate;

//Creating the instance of firestore
  final firestore = FirebaseFirestore.instance;
  //Creating the instance of firestorage
  final firebaseStorage = FirebaseStorage.instance;

//Making an image varialble private
  File? _selectedImage;

//Accessing the private image variable
  File? get image => _selectedImage;

//This function is used to set the image
  void setImage(File? image) {
    _selectedImage = image;
    notifyListeners();
  }

// Function used to pick image from the gallery of the device
  Future<void> pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;
    setImage(File(pickedImage.path));
  }

//This function used to get the picked date
  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

//This function give the formatted data
  String getFormattedDate(DateTime date) {
    return _selectedDate != null
        ? "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"
        : "Select Date of Birth";
  }

//This function helps to pick the date from calender
  Future<void> selectDate(
      BuildContext context, ServiceController serviceController) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != serviceController.selectedDate) {
      serviceController.setSelectedDate(picked);
    }
  }

//This function is used to store the images and videos to firebase storage
  Future<String> storeFileToFirebase(File image) async {
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref = firebaseStorage.ref().child('images').child(timestamp);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  //This function is used to add the data to firestore
  Future<void> addToFirestore({
    required String name,
    required String colors,
    required File? image,
    required String wheeltype,
    required String year,
    required BuildContext context,
  }) async {
    try {
      String downloadUrl = await storeFileToFirebase(image!);
      log(downloadUrl);

      var vechile = VechileModel(
        image: downloadUrl,
        color: colors,
        model: name,
        wheelType: wheeltype,
        manufactureYear: year,
      );
      await firestore.collection('vechiles').doc().set(vechile.toMap());
      Navigator.pushReplacementNamed(context, '/home');
      log('data added successfully');
    } catch (e) {
      log(' Error in fetching data:$e');
      throw Exception(e);
    }
    notifyListeners();
  }

  Stream<List<VechileModel>> getVechilesStream() {
    return firestore.collection('vechiles').snapshots().map(
      (QuerySnapshot querySnapshot) {
        List<VechileModel> vechiles = [];
        querySnapshot.docs.forEach((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
          vechiles.add(VechileModel.fromMap(data));
        });
        return vechiles;
      },
    );
  }
}
