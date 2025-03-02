part of '../glossary_page.dart';

class GlossaryMobilePage extends GetView<GlossaryController> {
  const GlossaryMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.offWhite,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: GlossarySearchField(
          onChanged: (text) => controller.searching(text),
        ),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Obx(() {
          final listWords = controller.words;
          final video = controller.video;
          final videoScale = controller.videoScale;
          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              SizedBox(
                width: constraints.maxWidth,
                child: SingleChildScrollView(
                  child: Column(children: [
                    ...listWords.map(
                      (word) {
                        final index = listWords.indexOf(word);
                        return GlossaryCard(
                          word: word,
                          onTap: () => controller.selectWord(word),
                        )
                            .animate()
                            .scale(duration: (400 + (index * 100)).ms)
                            .fade(duration: (400 + (index * 100)).ms);
                      },
                    ),
                  ]),
                ),
              ),
              if (video.value != null)
                VideoScaleButtonWrapper(
                  isExpanded: controller.isExpanded,
                  onResize: controller.changeVideoScale,
                  child: SizedBox(
                    height: Get.height * videoScale.height,
                    width: Get.width * videoScale.width,
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
                          videoUrl: video.value!,
                          autoPlay: true,
                        ),
                      ),
                    ),
                  ),
                )
            ],
          );
        });
      }),
    );
  }
}
