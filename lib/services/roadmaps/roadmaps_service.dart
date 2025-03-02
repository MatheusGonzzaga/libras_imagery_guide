import 'package:libras_imagery_guide/models/roadmap_model.dart';

abstract interface class RoadmapsService {
  Future<List<RoadmapModel>> getRoadmaps();
}
