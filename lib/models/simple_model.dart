import 'dart:convert';

class SimpleModel {
  final int id;
  final String name;

  SimpleModel({
    required this.id,
    required this.name,
  });

  SimpleModel copyWith({
    int? id,
    String? name,
  }) {
    return SimpleModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory SimpleModel.fromMap(Map<String, dynamic> map) {
    return SimpleModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SimpleModel.fromJson(String source) =>
      SimpleModel.fromMap(json.decode(source));

  @override
  String toString() => 'SimpleModel(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SimpleModel && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
