import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libras_imagery_guide/application/ui/theme_config.dart';
import 'package:libras_imagery_guide/application/ui/ui_scale.dart';
import 'package:libras_imagery_guide/models/about_model.dart';
import 'package:libras_imagery_guide/modules/about/about_controller.dart';

class AboutMobileCard extends StatelessWidget {
  final AboutModel about;
  final Function() onTap;

  const AboutMobileCard({
    super.key,
    required this.about,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AboutController>();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          margin: const EdgeInsets.symmetric(
            vertical: UiScale.s8,
            horizontal: UiScale.s16,
          ),
          color: AppTheme.darkBlue,
          child: Padding(
            padding: const EdgeInsets.all(UiScale.s8)
                .add(const EdgeInsets.only(right: 8.0)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ExpansionTile(
                    initiallyExpanded: true,
                    backgroundColor: AppTheme.darkBlue,
                    collapsedBackgroundColor: AppTheme.darkBlue,
                    textColor: AppTheme.yellow,
                    collapsedTextColor: AppTheme.blue,
                    collapsedShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(UiScale.s8),
                      ),
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(UiScale.s8),
                      ),
                    ),
                    iconColor: AppTheme.white,
                    collapsedIconColor: AppTheme.white,
                    title: Text(
                      about.title,
                      style: const TextStyle(
                        fontSize: UiScale.s24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(UiScale.s12),
                        child: Text(
                          about.description,
                          style: TextStyle(
                            color: AppTheme.white,
                            fontSize: UiScale.s16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Obx(() {
                  return SizedBox(
                    width: constraints.maxWidth * .08,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        controller.video != null
                            ? Icons.pause_circle
                            : Icons.play_circle,
                        size: 50,
                        color: controller.video != null
                            ? AppTheme.yellow
                            : AppTheme.blue,
                      ),
                      onPressed: onTap,
                    ),
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
