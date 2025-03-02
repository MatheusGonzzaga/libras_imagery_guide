import 'package:libras_imagery_guide/mock.dart';
import 'package:libras_imagery_guide/repositories/guide/guide_repository.dart';

class GuideRepositoryImpl implements GuideRepository {
  @override
  Future<List<String>> getGuideVideos() async => Mock.guideVideos;
}
