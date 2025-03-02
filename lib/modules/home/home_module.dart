import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:libras_imagery_guide/application/modules/module.dart';
import 'package:libras_imagery_guide/modules/home/home_page.dart';

class HomeModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/home',
      page: () => const HomePage(),
    )
  ];
}
