import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:libras_imagery_guide/application/ui/theme_config.dart';
import 'package:libras_imagery_guide/application/ui/ui_scale.dart';
import 'package:libras_imagery_guide/modules/about/about_controller.dart';
import 'package:libras_imagery_guide/modules/about/widgets/about_card/about_mobile_card.dart';
import 'package:libras_imagery_guide/modules/about/widgets/author_card/author_mobile_card.dart';
import 'package:libras_imagery_guide/shared/youtube_video_player/youtube_video_player.dart';

class AboutMobilePage extends GetView<AboutController> {
  const AboutMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.offWhite,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              Obx(() {
                return SizedBox(
                  width: constraints.maxWidth,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      ...List.from(
                        controller.abouts.map(
                          (about) {
                            final index = controller.abouts.indexOf(about);
                            return AboutMobileCard(
                              about: about,
                              onTap: () => controller.selectAboutVideo(about),
                            )
                                .animate()
                                .scale(duration: (100 + (index * 100)).ms)
                                .fade(duration: (100 + (index * 100)).ms);
                          },
                        ),
                      ),
                      ...List.from(
                        controller.authors.map(
                          (author) {
                            final index = controller.authors.indexOf(author);
                            return AuthorMobileCard(
                              author: author,
                            )
                                .animate()
                                .scale(duration: (100 + (index * 100)).ms)
                                .fade(duration: (100 + (index * 100)).ms);
                          },
                        ),
                      ),
                      if (controller.video != null)
                        SizedBox(
                          height: constraints.maxHeight * .35,
                        )
                    ]),
                  ),
                );
              }),
              Obx(() {
                if (controller.video != null) {
                  return SizedBox(
                      height: constraints.maxHeight * .35,
                      width: constraints.maxWidth,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: UiScale.s8,
                          horizontal: UiScale.s16,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            UiScale.s16,
                          ),
                          child: YoutubeVideoPlayer(
                            videoUrl: controller.video!,
                            autoPlay: true,
                          ),
                        ),
                      ));
                } else {
                  return const SizedBox.shrink();
                }
              }),
            ],
          );
        },
      ),
    );
  }
}
