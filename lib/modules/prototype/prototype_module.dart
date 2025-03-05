import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:libras_imagery_guide/application/modules/module.dart';

import 'package:libras_imagery_guide/modules/prototype/prototype_page.dart';

class PrototypeModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/prototype',
      page: () => const PrototypePage(),
    )
  ];
}
