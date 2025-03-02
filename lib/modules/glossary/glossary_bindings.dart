import 'package:get/get.dart';
import 'package:libras_imagery_guide/modules/glossary/glossary_controller.dart';

class GlossaryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => GlossaryController(
        wordsService: Get.find(),
      ),
      fenix: true,
    );
  }
}
