import 'package:flutter/material.dart';

class ServiceController extends ChangeNotifier {
  
  DateTime? _selectedDate;

  DateTime? get selectedDate => _selectedDate;


  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

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
