part of '../glossary_page.dart';

class GlossaryWebPage extends GetView<GlossaryController> {
  const GlossaryWebPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppTheme.offWhite,
      body: Obx(() {
        final listWords = controller.words;
        final video = controller.video;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: Get.width * .65,
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(
                    height: UiScale.s72,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: UiScale.s16)
                              .add(const EdgeInsets.only(top: UiScale.s16)),
                      child: GlossarySearchField(
                        onChanged: (text) => controller.searching(text),
                      ),
                    ),
                  ),
                  ...List.from(
                    listWords.map(
                      (word) {
                        final index = listWords.indexOf(word);
                        return GlossaryCard(
                          word: word,
                          onTap: () => controller.selectWord(word),
                        )
                            .animate()
                            .scale(duration: (100 + (index * 100)).ms)
                            .fade(duration: (100 + (index * 100)).ms);
                      },
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: Get.height * .92,
              width: Get.width * .35,
              child: video() != null
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
                          videoUrl: video()!,
                          autoPlay: true,
                        ),
                      ),
                    )
                  : const VideoPlaceholder(
                      text: UiText.clickWord,
                    ),
            ),
          ],
        );
      }),
    );
  }
}
