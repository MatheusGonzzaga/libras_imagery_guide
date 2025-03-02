import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libras_imagery_guide/application/ui/platform_utils/platform_utils.dart';
import 'package:libras_imagery_guide/application/ui/theme_config.dart';
import 'package:libras_imagery_guide/application/ui/ui_scale.dart';
import 'package:libras_imagery_guide/modules/roadmap/roadmap_controller.dart';

class RoadmapControllerButtons extends StatelessWidget {
  final RoadmapController controller;
  const RoadmapControllerButtons({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final platformUtils = Get.find<PlatformUtils>();
    if (platformUtils.isWeb) {
      return Obx(() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                Icons.keyboard_arrow_left_sharp,
                size: UiScale.s56,
                color: controller.hasPrevPage
                    ? AppTheme.darkBlue
                    : Colors.grey.shade300,
              ),
              onPressed: controller.hasPrevPage ? controller.prevPage : null,
            ),
            IconButton(
              icon: Icon(
                Icons.keyboard_arrow_right_sharp,
                size: UiScale.s56,
                color: controller.hasNextPage
                    ? AppTheme.darkBlue
                    : Colors.grey.shade300,
              ),
              onPressed: controller.hasNextPage ? controller.nextPage : null,
            ),
          ],
        );
      });
    } else {
      return Obx(() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.darkBlue,
                  fontSize: UiScale.s24,
                ),
              ),
              onPressed: controller.hasPrevPage ? controller.prevPage : null,
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: UiScale.s4,
                  horizontal: UiScale.s8,
                ),
                child: Text('ANTERIOR'),
              ),
            ),
            ElevatedButton(
              onPressed: controller.hasNextPage ? controller.nextPage : null,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: UiScale.s4,
                  horizontal: UiScale.s8,
                ),
                child: Text(
                  'PROXIMO',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.white,
                    fontSize: UiScale.s24,
                  ),
                ),
              ),
            ),
          ],
        );
      });
    }
  }
}
