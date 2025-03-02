import 'dart:convert';

class WordModel {
  final int id;
  final String name;
  final String meaning;
  final String video;

  WordModel({
    required this.id,
    required this.name,
    required this.meaning,
    required this.video,
  });

  WordModel copyWith({
    int? id,
    String? name,
    String? meaning,
    String? video,
  }) {
    return WordModel(
      id: id ?? this.id,
      name: name ?? this.name,
      meaning: meaning ?? this.meaning,
      video: video ?? this.video,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'meaning': meaning,
      'video': video,
    };
  }

  factory WordModel.fromMap(Map<String, dynamic> map) {
    return WordModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      meaning: map['meaning'] ?? '',
      video: map['video'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory WordModel.fromJson(String source) =>
      WordModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'WordModel(id: $id, name: $name, meaning: $meaning, video: $video)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WordModel &&
        other.id == id &&
        other.name == name &&
        other.meaning == meaning &&
        other.video == video;
  }

  @override
  int get hashCode =>
      id.hashCode ^ name.hashCode ^ meaning.hashCode ^ video.hashCode;
}
