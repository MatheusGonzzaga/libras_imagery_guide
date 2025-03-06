import 'package:get/get.dart';

class HomeController extends GetxController {
  static const NAVIGATOR_KEY = 1;

  final _pages = ['/about', '/roadmaps', '/guide', '/glossary'];

  final RxInt _pageIndex = 0.obs;

  int get pageIndex => _pageIndex();

  void goToPage(int page) {
    _pageIndex.value = page;
    Get.toNamed(_pages[page], id: NAVIGATOR_KEY);
  }

  void updatePageIndex(String route) {
    int index = _pages.indexOf(route);
    if (index != -1) {
      _pageIndex.value = index;
    }
  }
}
