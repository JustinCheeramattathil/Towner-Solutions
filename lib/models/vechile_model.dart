// ignore_for_file: public_member_api_docs, sort_constructors_first


class VechileModel {
  // String id;
  String image;
  String color;
  String model;
  String wheelType;
  String manufactureYear;

  VechileModel({
    // required this.id,
    required this.image,
    required this.color,
    required this.model,
    required this.wheelType,
    required this.manufactureYear,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'id':id,
      'imageUrl': image,
      'color': color,
      'model': model,
      'wheelType': wheelType,
      'manufactureYear': manufactureYear,
    };
  }

  factory VechileModel.fromMap(Map<String, dynamic> map) {
    return VechileModel(
      // id:map['id'] as String,
      image: map['imageUrl'] as String,
      color: map['color'] as String,
      model: map['model'] as String,
      wheelType: map['wheelType'] as String,
      manufactureYear: map['manufactureYear'] as String,
    );
  }
}
