import 'package:libras_imagery_guide/mock.dart';
import 'package:libras_imagery_guide/models/roadmap_model.dart';
import 'package:libras_imagery_guide/repositories/roadmaps/roadmaps_repository.dart';

class RoadmapsRepositoryImpl implements RoadmapsRepository {
  @override
  Future<List<RoadmapModel>> getRoadmaps() async {
    final result = List<RoadmapModel>.from(
        Mock.roadmaps.map((g) => RoadmapModel.fromMap(g)));
    // await Future.delayed(Duration(seconds: 3), () {});
    return result;
  }
}
