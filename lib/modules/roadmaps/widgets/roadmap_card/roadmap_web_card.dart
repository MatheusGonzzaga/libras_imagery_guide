import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libras_imagery_guide/application/ui/theme_config.dart';
import 'package:libras_imagery_guide/application/ui/ui_scale.dart';
import 'package:libras_imagery_guide/models/roadmap_model.dart';

class RoadmapWebCard extends StatelessWidget {
  final RoadmapModel roadmap;

  const RoadmapWebCard({
    super.key,
    required this.roadmap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return InkWell(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        onTap: () {
          Get.toNamed('/roadmap', arguments: roadmap);
        },
        child: Card(
          margin: const EdgeInsets.only(right: UiScale.s24),
          color: AppTheme.darkBlue,
          child: SizedBox(
            width: UiScale.s264,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: roadmap.id,
                  child: SizedBox(
                    width: Get.width,
                    height: constraints.maxHeight * .7,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(UiScale.s8),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(UiScale.s8),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.network(
                              roadmap.image,
                              fit: BoxFit.fill,
                              width: Get.width,
                              height: Get.height,
                              errorBuilder: (_, __, ___) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: AppTheme.blue.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: AppTheme.offWhite,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.book,
                                    size: 136,
                                    color: AppTheme.offWhite.withOpacity(0.3),
                                  ),
                                );
                              },
                            ),
                            Icon(
                              Icons.play_circle,
                              size: 80,
                              color: AppTheme.white.withOpacity(.8),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: UiScale.s12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: UiScale.s8),
                  child: Text(
                    roadmap.title.toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: UiScale.s16,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
