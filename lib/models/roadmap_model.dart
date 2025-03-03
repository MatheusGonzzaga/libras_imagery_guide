import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:libras_imagery_guide/models/roadmap_step.dart';

class RoadmapModel {
  final int id;
  final String title;
  final String image;
  final int epoch;
  final List<int> genres;
  final List<int> words;
  final List<RoadmapStep> steps;

  RoadmapModel({
    required this.id,
    required this.title,
    required this.image,
    required this.epoch,
    required this.genres,
    required this.words,
    required this.steps,
  });

  RoadmapModel copyWith({
    int? id,
    String? title,
    String? image,
    int? epoch,
    List<int>? genres,
    List<int>? words,
    List<RoadmapStep>? steps,
  }) {
    return RoadmapModel(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      epoch: epoch ?? this.epoch,
      genres: genres ?? this.genres,
      words: words ?? this.words,
      steps: steps ?? this.steps,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'epoch': epoch,
      'genres': genres,
      'words': words,
      'steps': steps.map((x) => x.toMap()).toList(),
    };
  }

  factory RoadmapModel.fromMap(Map<String, dynamic> map) {
    return RoadmapModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      epoch: map['epoch']?.toInt() ?? 0,
      genres: List<int>.from(map['genres'] ?? const []),
      words: List<int>.from(map['words'] ?? const []),
      steps: List<RoadmapStep>.from(
          map['steps']?.map((x) => RoadmapStep.fromMap(x)) ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory RoadmapModel.fromJson(String source) =>
      RoadmapModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GuideModel(id: $id, title: $title, image: $image, epoch: $epoch, genres: $genres, words: $words, steps: $steps)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is RoadmapModel &&
        other.id == id &&
        other.title == title &&
        other.image == image &&
        other.epoch == epoch &&
        listEquals(other.genres, genres) &&
        listEquals(other.words, words) &&
        listEquals(other.steps, steps);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        image.hashCode ^
        epoch.hashCode ^
        genres.hashCode ^
        words.hashCode ^
        steps.hashCode;
  }
}
