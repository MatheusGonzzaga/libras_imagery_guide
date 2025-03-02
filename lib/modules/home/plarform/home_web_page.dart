part of '../home_page.dart';

class HomeWebPage extends GetView<HomeController> {
  const HomeWebPage({super.key});

  Widget _buildNavButton(String title, int index) {
    return Obx(
      () => TextButton(
        onPressed: () => controller.goToPage(index),
        child: Text(
          title,
          style: TextStyle(
            color: controller.pageIndex == index
                ? AppTheme.yellow
                : AppTheme.offWhite,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: UiScale.s88,
        leading: Container(
          padding: const EdgeInsets.only(left: UiScale.s32),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/logo/logo.png'),
            ),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildNavButton('INICIO', 0),
            const SizedBox(width: 16),
            _buildNavButton('ROTEIRO IMAGÉTICO', 1),
            const SizedBox(width: 16),
            _buildNavButton('GUIA', 2),
            const SizedBox(width: 16),
            _buildNavButton('GLOSSARIO', 3),
          ],
        ),
        backgroundColor: AppTheme.darkBlue,
        elevation: 2,
      ),
      body: Navigator(
        initialRoute: '/roadmaps',
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: (settings) {
          controller.updatePageIndex(settings.name ?? '/roadmaps');

          switch (settings.name) {
            case '/about':
              return GetPageRoute(
                settings: settings,
                page: () => const AboutPage(),
                binding: AboutBindings(),
              );
            case '/roadmaps':
              return GetPageRoute(
                settings: settings,
                page: () => const RoadmapsPage(),
                binding: RoadmapsBindings(),
              );
            case '/guide':
              return GetPageRoute(
                settings: settings,
                page: () => const GuidePage(),
                binding: GuideBindings(),
              );
            case '/glossary':
              return GetPageRoute(
                settings: settings,
                page: () => const GlossaryPage(),
                binding: GlossaryBindings(),
              );
            default:
              return null;
          }
        },
      ),
    );
  }
}
