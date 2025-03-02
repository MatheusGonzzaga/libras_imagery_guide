import 'package:libras_imagery_guide/repositories/guide/guide_repository.dart';
import 'package:libras_imagery_guide/services/guide/guide_service.dart';

class GuideServiceImpl implements GuideService {
  final GuideRepository _guideRepository;

  GuideServiceImpl({
    required GuideRepository guideRepository,
  }) : _guideRepository = guideRepository;

  @override
  Future<List<String>> getGuideVideos() async {
    final guideVideos = await _guideRepository.getGuideVideos();
    return guideVideos;
  }
}
