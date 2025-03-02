import 'package:libras_imagery_guide/models/roadmap_model.dart';

abstract interface class RoadmapsRepository {
  Future<List<RoadmapModel>> getRoadmaps();
}
