import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:libras_imagery_guide/application/bindings/application_bindings.dart';
import 'package:libras_imagery_guide/application/ui/app_ui_config.dart';

import 'package:libras_imagery_guide/modules/home/home_module.dart';
import 'package:libras_imagery_guide/modules/roadmap/roadmap_module.dart';
import 'package:libras_imagery_guide/modules/splash/splash_module.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const LibrasImageryGuide());
}

class LibrasImageryGuide extends StatelessWidget {
  const LibrasImageryGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppUiConfig.title,
      debugShowCheckedModeBanner: false,
      initialBinding: ApplicationBindings(),
      theme: AppUiConfig.theme,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      getPages: [
        ...SplashModule().routers,
        ...HomeModule().routers,
        ...RoadmapModule().routers,
      ],
    );
  }
}
