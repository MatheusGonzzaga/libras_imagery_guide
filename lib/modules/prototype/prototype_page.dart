import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:libras_imagery_guide/application/ui/platform_utils/platform_utils.dart';
import 'package:libras_imagery_guide/application/ui/theme_config.dart';
import 'package:libras_imagery_guide/application/ui/ui_scale.dart';
import 'package:libras_imagery_guide/modules/prototype/widgets/prototype_item.dart';

part 'platform/prototype_mobile_page.dart';
part 'platform/prototype_web_page.dart';

class PrototypePage extends StatelessWidget {
  const PrototypePage({super.key});

  @override
  Widget build(BuildContext context) {
    final platformUtils = Get.find<PlatformUtils>();
    if (platformUtils.isWeb) return const PrototypeWebPage();
    return const PrototypeMobilePage();
  }
}
