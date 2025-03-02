import 'package:libras_imagery_guide/models/roadmap_model.dart';
import 'package:libras_imagery_guide/repositories/roadmaps/roadmaps_repository.dart';
import 'package:libras_imagery_guide/services/roadmaps/roadmaps_service.dart';

class RoadmapsServiceImpl implements RoadmapsService {
  final RoadmapsRepository _roadmapsRepository;

  RoadmapsServiceImpl({
    required RoadmapsRepository roadmapsRepository,
  }) : _roadmapsRepository = roadmapsRepository;

  @override
  Future<List<RoadmapModel>> getRoadmaps() async =>
      await _roadmapsRepository.getRoadmaps();
}
