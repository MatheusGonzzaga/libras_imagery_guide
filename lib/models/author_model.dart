import 'dart:convert';

class AuthorModel {
  final String name;
  final String position;
  final String description;
  final String image;

  AuthorModel({
    required this.name,
    required this.position,
    required this.description,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'position': position,
      'description': description,
      'image': image,
    };
  }

  factory AuthorModel.fromMap(Map<String, dynamic> map) {
    return AuthorModel(
      name: map['name'] ?? '',
      position: map['position'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthorModel.fromJson(String source) =>
      AuthorModel.fromMap(json.decode(source));
}
