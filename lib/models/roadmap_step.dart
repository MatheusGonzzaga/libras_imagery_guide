import 'dart:convert';

class RoadmapStep {
  final String image;
  final String video;
  final String description;

  RoadmapStep({
    required this.image,
    required this.video,
    required this.description,
  });

  RoadmapStep copyWith({
    int? order,
    String? image,
    String? video,
    String? description,
  }) {
    return RoadmapStep(
      image: image ?? this.image,
      video: video ?? this.video,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'video': video,
      'description': description,
    };
  }

  factory RoadmapStep.fromMap(Map<String, dynamic> map) {
    return RoadmapStep(
      image: map['image'] ?? '',
      video: map['video'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RoadmapStep.fromJson(String source) =>
      RoadmapStep.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GuideStep(image: $image, video: $video, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RoadmapStep &&
        other.image == image &&
        other.video == video &&
        other.description == description;
  }

  @override
  int get hashCode {
    return image.hashCode ^ video.hashCode ^ description.hashCode;
  }
}
