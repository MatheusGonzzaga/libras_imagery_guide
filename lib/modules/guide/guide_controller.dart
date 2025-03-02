import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libras_imagery_guide/services/guide/guide_service.dart';

class GuideController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;
  final RxList<String> videoUrls = <String>[].obs;

  final RxBool _isVideoVisible = false.obs; // Gerenciamento de visibilidade
  bool get isVideoVisible => _isVideoVisible();

  final GuideService _guideService;

  GuideController({required GuideService guideService})
      : _guideService = guideService;

  int get totalPages => videoUrls.length;

  bool get hasNextPage => currentPage.value < totalPages - 1;
  bool get hasPrevPage => currentPage.value > 0;

  void nextPage() {
    if (hasNextPage) {
      currentPage.value++;
      pageController.animateToPage(
        currentPage.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void prevPage() {
    if (hasPrevPage) {
      currentPage.value--;
      pageController.animateToPage(
        currentPage.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> loadVideos() async {
    try {
      var result = await _guideService.getGuideVideos();
      videoUrls.assignAll(result);
    } catch (e) {
      Get.snackbar("Erro", "Erro ao carregar os vídeos");
    }
  }

  void showVideo() {
    _isVideoVisible.value = !_isVideoVisible.value;
  }

  @override
  void onInit() {
    super.onInit();
    loadVideos();
  }
}
