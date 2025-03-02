import 'package:get/get.dart';
import 'package:libras_imagery_guide/application/ui/platform_utils/platform_utils.dart';
import 'package:libras_imagery_guide/modules/home/home_controller.dart';
import 'package:libras_imagery_guide/repositories/words/words_repository.dart';
import 'package:libras_imagery_guide/repositories/words/words_repository_impl.dart';
import 'package:libras_imagery_guide/services/words/words_service.dart';
import 'package:libras_imagery_guide/services/words/words_service_impl.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => PlatformUtils(Get.context!),
      fenix: true,
    );
    Get.lazyPut(
      () => HomeController(),
      fenix: true,
    );
    Get.lazyPut<WordsRepository>(
      () => WordsRepositoryImpl(),
      fenix: true,
    );
    Get.lazyPut<WordsService>(
      () => WordsServiceImpl(wordsRepository: Get.find()),
      fenix: true,
    );
  }
}
