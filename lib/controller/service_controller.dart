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
 



//Making an image varialble private
  File? _pickedImage;

//Accessing the private image variable
  File? get image => _pickedImage;

//This function is used to set the image
  void setImage(File? image) {
    _pickedImage = image;
    notifyListeners();
  }

// Function used to pick image from the gallery of the device
  Future<void> pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) return;
    setImage(File(pickedImage.path));
  }

//This is the function to clear the picked image
  void clearPickedImage() {
    _pickedImage = null;
    notifyListeners();
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


}
