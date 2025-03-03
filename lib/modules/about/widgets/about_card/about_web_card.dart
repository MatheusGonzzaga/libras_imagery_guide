import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libras_imagery_guide/application/ui/theme_config.dart';
import 'package:libras_imagery_guide/application/ui/ui_scale.dart';
import 'package:libras_imagery_guide/models/about_model.dart';
import 'package:libras_imagery_guide/modules/about/about_controller.dart';

class AboutWebCard extends StatelessWidget {
  final AboutModel about;
  final Function() onTap;

  const AboutWebCard({
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
            padding: const EdgeInsets.all(UiScale.s8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: UiScale.s16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          about.title,
                          style: TextStyle(
                            fontSize:
                                UiScale.scaleSize(constraints, UiScale.s40),
                            fontWeight: FontWeight.bold,
                            color: AppTheme.yellow,
                          ),
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
                ExpansionTile(
                  tilePadding:
                      const EdgeInsets.symmetric(horizontal: UiScale.s16),
                  initiallyExpanded: true,
                  backgroundColor: AppTheme.darkBlue,
                  collapsedBackgroundColor: AppTheme.darkBlue,
                  textColor: AppTheme.white,
                  collapsedTextColor: AppTheme.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(UiScale.s8),
                    ),
                  ),
                  iconColor: AppTheme.white,
                  collapsedIconColor: AppTheme.white,
                  title: Text(
                    'Apresentação',
                    style: TextStyle(
                      fontSize: UiScale.scaleSize(constraints, UiScale.s32),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(UiScale.s12),
                      child: Text(
                        about.description,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: AppTheme.white,
                          fontSize: UiScale.s16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
