part of '../about_page.dart';

class AboutWebPage extends GetView<AboutController> {
  const AboutWebPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppTheme.offWhite,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                return SizedBox(
                  width: constraints.maxWidth * .65,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      ...List.from(
                        controller.abouts.map(
                          (about) {
                            final index = controller.abouts.indexOf(about);
                            return AboutWebCard(
                              about: about,
                              onTap: () => controller.selectAboutVideo(about),
                            )
                                .animate()
                                .scale(duration: (100 + (index * 100)).ms)
                                .fade(duration: (100 + (index * 100)).ms);
                          },
                        ),
                      ),
                      const PrototypeCard(),
                      ...List.from(
                        controller.authors.map(
                          (author) {
                            final index = controller.authors.indexOf(author);
                            return AuthorWebCard(
                              author: author,
                            )
                                .animate()
                                .scale(duration: (100 + (index * 100)).ms)
                                .fade(duration: (100 + (index * 100)).ms);
                          },
                        ),
                      ),
                    ]),
                  ),
                );
              }),
              Obx(() {
                return SizedBox(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth * .35,
                  child: controller.video != null
                      ? Padding(
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
                        )
                      : const VideoPlaceholder(),
                );
              }),
            ],
          );
        },
      ),
    );
  }
}
