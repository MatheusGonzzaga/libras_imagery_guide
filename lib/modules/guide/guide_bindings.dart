import 'package:get/get.dart';
import 'package:libras_imagery_guide/modules/guide/guide_controller.dart';
import 'package:libras_imagery_guide/repositories/guide/guide_repository.dart';
import 'package:libras_imagery_guide/repositories/guide/guide_repository_impl.dart';
import 'package:libras_imagery_guide/services/guide/guide_service.dart';
import 'package:libras_imagery_guide/services/guide/guide_service_impl.dart';

class GuideBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GuideRepository>(
      () => GuideRepositoryImpl(),
    );
    Get.lazyPut<GuideService>(
      () => GuideServiceImpl(
        guideRepository: Get.find(),
      ),
    );
    Get.lazyPut(
      () => GuideController(
        guideService: Get.find(),
      ),
    );
  }
}
