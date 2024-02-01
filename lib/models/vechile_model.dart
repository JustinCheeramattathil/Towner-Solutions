// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

class VechileModel {
  dynamic id;
  File imageUrl;
  String color;
  String model;
  String wheelType;
  String manufactureYear;

  VechileModel({
    this.id,
    required this.imageUrl,
    required this.color,
    required this.model,
    required this.wheelType,
    required this.manufactureYear,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'imageUrl': imageUrl,
      'color': color,
      'model': model,
      'wheelType': wheelType,
      'manufactureYear': manufactureYear,
    };
  }

  factory VechileModel.fromMap(Map<String, dynamic> map) {
    return VechileModel(
      id: map['id'] as dynamic,
      imageUrl: map['imageUrl'] as File,
      color: map['color'] as String,
      model: map['model'] as String,
      wheelType: map['wheelType'] as String,
      manufactureYear: map['manufactureYear'] as String,
    );
  }
}
