import 'package:get/get.dart';
import 'package:libras_imagery_guide/modules/about/about_controller.dart';
import 'package:libras_imagery_guide/repositories/about/about_repository.dart';
import 'package:libras_imagery_guide/repositories/about/about_repository_impl.dart';
import 'package:libras_imagery_guide/services/about/about_service.dart';
import 'package:libras_imagery_guide/services/about/about_service_impl.dart';

class AboutBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutRepository>(
      () => AboutRepositoryImpl(),
    );
    Get.lazyPut<AboutService>(
      () => AboutsServiceImpl(aboutRepository: Get.find()),
    );
    Get.lazyPut(
      () => AboutController(
        aboutService: Get.find(),
      ),
      fenix: true,
    );
  }
}
