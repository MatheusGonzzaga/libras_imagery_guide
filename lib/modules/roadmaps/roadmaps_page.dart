import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libras_imagery_guide/application/ui/platform_utils/platform_utils.dart';
import 'package:libras_imagery_guide/application/ui/theme_config.dart';
import 'package:libras_imagery_guide/application/ui/ui_scale.dart';
import 'package:libras_imagery_guide/models/roadmap_model.dart';
import 'package:libras_imagery_guide/modules/roadmaps/roadmaps_controller.dart';
import 'package:libras_imagery_guide/modules/roadmaps/widgets/roadmaps_group.dart';

part 'platform/roadmaps_mobile_page.dart';
part 'platform/roadmaps_web_page.dart';

class RoadmapsPage extends GetView<RoadmapsController> {
  const RoadmapsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final platformUtils = Get.find<PlatformUtils>();
    if (platformUtils.isWeb) return const RoadmapsWebPage();
    return const RoadmapsMobilePage();
  }
}
