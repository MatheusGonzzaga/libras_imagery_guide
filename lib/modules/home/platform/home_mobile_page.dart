part of '../home_page.dart';

class HomeMobilePage extends GetView<HomeController> {
  const HomeMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        initialRoute: '/about',
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: (settings) {
          if (settings.name == '/about') {
            return GetPageRoute(
              settings: settings,
              page: () => const AboutPage(),
              binding: AboutBindings(),
            );
          }
          if (settings.name == '/roadmaps') {
            return GetPageRoute(
              settings: settings,
              page: () => const RoadmapsPage(),
              binding: RoadmapsBindings(),
            );
          }
          if (settings.name == '/guide') {
            return GetPageRoute(
              settings: settings,
              page: () => const GuidePage(),
              binding: GuideBindings(),
            );
          }
          if (settings.name == '/glossary') {
            return GetPageRoute(
              settings: settings,
              page: () => const GlossaryPage(),
              binding: GlossaryBindings(),
            );
          }
          return null;
        },
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppTheme.darkBlue,
          selectedItemColor: AppTheme.yellow,
          unselectedItemColor: AppTheme.white,
          onTap: controller.goToPage,
          currentIndex: controller.pageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'InÍcio',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.menu_book_rounded,
                size: 20,
              ),
              label: 'Roteiros',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.file_present_rounded,
                size: 20,
              ),
              label: 'Guia',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.book,
                size: 20,
              ),
              label: 'Glossário',
            ),
          ],
        );
      }),
    );
  }
}
