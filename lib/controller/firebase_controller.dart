// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:towner/models/vechile_model.dart';

class FirebaseController extends ChangeNotifier{
  //Creating the instance of firestore
  final firestore = FirebaseFirestore.instance;
  //Creating the instance of firestorage
  final firebaseStorage = FirebaseStorage.instance;

  bool _isAddingData = false;
  bool get isAddingData => _isAddingData;

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
     
       _isAddingData = false;
      notifyListeners();
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
        for (var document in querySnapshot.docs) {
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
          vechiles.add(VechileModel.fromMap(data));
        }
        return vechiles;
      },
    );
  }
}