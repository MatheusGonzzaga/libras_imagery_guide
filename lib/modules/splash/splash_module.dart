import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:libras_imagery_guide/application/modules/module.dart';
import 'package:libras_imagery_guide/modules/splash/splash_page.dart';

class SplashModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/',
      page: () => const SplashPage(),
    )
  ];
}
