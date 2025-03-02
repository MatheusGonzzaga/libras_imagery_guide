import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libras_imagery_guide/application/ui/platform_utils/platform_utils.dart';
import 'package:libras_imagery_guide/application/ui/theme_config.dart';
import 'package:libras_imagery_guide/application/ui/ui_scale.dart';
import 'package:libras_imagery_guide/models/roadmap_model.dart';
import 'package:libras_imagery_guide/modules/roadmaps/roadmaps_controller.dart';
import 'package:libras_imagery_guide/modules/roadmaps/widgets/roadmap_card/roadmap_mobile_card.dart';
import 'package:libras_imagery_guide/modules/roadmaps/widgets/roadmap_card/roadmap_web_card.dart';

class RoadmapsGroup extends GetView<RoadmapsController> {
  final String? title;
  final List<RoadmapModel> roadmaps;
  const RoadmapsGroup({
    this.title,
    required this.roadmaps,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(
              left: UiScale.s8,
              bottom: UiScale.s8,
              top: UiScale.s8,
            ),
            child: Text(
              title!,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTheme.darkBlue,
              ),
            ),
          ),
        SizedBox(
          height: UiScale.s256,
          width: Get.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: roadmaps.length,
            itemBuilder: (context, index) {
              final roadmap = roadmaps[index];
              final platformUtils = Get.find<PlatformUtils>();
              return platformUtils.isWeb
                  ? RoadmapWebCard(roadmap: roadmap)
                  : RoadmapMobileCard(roadmap: roadmap);
            },
          ),
        )
      ],
    );
  }
}
