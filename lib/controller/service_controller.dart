import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ServiceController extends ChangeNotifier {
  DateTime? _selectedDate;

  DateTime? get selectedDate => _selectedDate;

  File? _selectedImage;

  File? get image => _selectedImage;
  

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


  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

//This function give the formatted data
  String getFormattedDate() {
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
