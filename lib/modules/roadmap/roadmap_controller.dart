import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libras_imagery_guide/models/roadmap_model.dart';

class RoadmapController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;
  final RoadmapModel roadmap;

  RoadmapController({required this.roadmap});

  int get totalPages => roadmap.steps.length;

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
}
