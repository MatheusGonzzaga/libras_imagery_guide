import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:libras_imagery_guide/application/ui/platform_utils/platform_utils.dart';
import 'package:libras_imagery_guide/application/ui/theme_config.dart';
import 'package:libras_imagery_guide/application/ui/ui_scale.dart';
import 'package:libras_imagery_guide/models/roadmap_model.dart';
import 'package:libras_imagery_guide/modules/roadmap/roadmap_controller.dart';
import 'package:libras_imagery_guide/modules/roadmap/widgets/roadmap_controller_buttons.dart';
import 'package:libras_imagery_guide/modules/roadmap/widgets/roadmap_step_view/roadmap_mobile_step_view.dart';
import 'package:libras_imagery_guide/modules/roadmap/widgets/roadmap_step_view/roadmap_web_step_view.dart';

part 'platform/roadmap_mobile_page.dart';
part 'platform/roadmap_web_page.dart';

class RoadmapPage extends StatelessWidget {
  final RoadmapModel roadmap;

  const RoadmapPage({
    super.key,
    required this.roadmap,
  });

  @override
  Widget build(BuildContext context) {
    final platformUtils = Get.find<PlatformUtils>();
    if (platformUtils.isWeb) {
      return RoadmapWebPage(roadmap: roadmap);
    }
    return RoadmapMobilePage(roadmap: roadmap);
  }
}
