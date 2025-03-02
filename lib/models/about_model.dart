import 'dart:convert';

class AboutModel {
  final String title;
  final String description;
  final String videoUrl;

  AboutModel({
    required this.title,
    required this.description,
    required this.videoUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'video': videoUrl,
    };
  }

  factory AboutModel.fromMap(Map<String, dynamic> map) {
    return AboutModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      videoUrl: map['video'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AboutModel.fromJson(String source) =>
      AboutModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'AboutModel(title: $title, description: $description, videoUrl: $videoUrl)';
}
