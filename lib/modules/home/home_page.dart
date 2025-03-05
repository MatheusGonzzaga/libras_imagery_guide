import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libras_imagery_guide/application/ui/theme_config.dart';
import 'package:libras_imagery_guide/application/ui/platform_utils/platform_utils.dart';
import 'package:libras_imagery_guide/application/ui/ui_scale.dart';
import 'package:libras_imagery_guide/modules/about/about_bindings.dart';
import 'package:libras_imagery_guide/modules/about/about_page.dart';
import 'package:libras_imagery_guide/modules/glossary/glossary_bindings.dart';
import 'package:libras_imagery_guide/modules/glossary/glossary_page.dart';
import 'package:libras_imagery_guide/modules/guide/guide_bindings.dart';
import 'package:libras_imagery_guide/modules/guide/guide_page.dart';
import 'package:libras_imagery_guide/modules/roadmaps/roadmaps_bindings.dart';
import 'package:libras_imagery_guide/modules/roadmaps/roadmaps_page.dart';
import 'package:libras_imagery_guide/modules/home/home_controller.dart';

part 'platform/home_mobile_page.dart';
part 'platform/home_web_page.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final platformUtils = Get.find<PlatformUtils>();
    if (platformUtils.isWeb) return const HomeWebPage();
    return const HomeMobilePage();
  }
}
