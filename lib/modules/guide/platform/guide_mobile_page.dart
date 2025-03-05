// part of '../guide_page.dart';

// class GuideMobilePage extends StatelessWidget {
//   const GuideMobilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppTheme.offWhite,
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: AppTheme.darkBlue,
//         onPressed: () {},
//         child: Icon(
//           Icons.play_arrow,
//           size: UiScale.s40,
//           color: AppTheme.yellow,
//         ),
//       ),
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           return Stack(
//             children: [
//               Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     width: constraints.maxWidth,
//                     child: const PdfViewerPage(
//                       title:
//                           'Guia Prático para o Desenvolvimento de Roteiros Imagéticos Sinalizados',
//                       path: Mock.guidePath,
//                       pdfHeight: .88,
//                     ),
//                   ),

//                 ],
//               ),
//               Obx(() {
//                 if (controller.video != null) {
//                   return SizedBox(
//                       height: constraints.maxHeight * .35,
//                       width: constraints.maxWidth,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                           vertical: UiScale.s8,
//                           horizontal: UiScale.s16,
//                         ),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(
//                             UiScale.s16,
//                           ),
//                           child: YoutubeVideoPlayer(
//                             videoUrl: controller.video!,
//                             autoPlay: true,
//                           ),
//                         ),
//                       ));
//                 } else {
//                   return const SizedBox.shrink();
//                 }
//               }),

//               // SizedBox(
//                   //   height: constraints.maxHeight * ,
//                   //   width: constraints.maxWidth * .35,
//                   //   child: Padding(
//                   //     padding: const EdgeInsets.symmetric(
//                   //       vertical: UiScale.s8,
//                   //       horizontal: UiScale.s16,
//                   //     ),
//                   //     child: ClipRRect(
//                   //       borderRadius: BorderRadius.circular(
//                   //         UiScale.s16,
//                   //       ),
//                   //       child: const YoutubeVideoPlayer(videoUrl: Mock.guideVideo),
//                   //     ),
//                   //   ),
//                   // ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

part of '../guide_page.dart';

class GuideMobilePage extends StatelessWidget {
  const GuideMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final GuideController controller = Get.find<GuideController>();

    return Scaffold(
      backgroundColor: AppTheme.offWhite,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(() {
        return !controller.isVideoVisible
            ? FloatingActionButton(
                backgroundColor: AppTheme.darkBlue,
                onPressed: controller.showVideo,
                child: Icon(
                  Icons.play_arrow,
                  size: UiScale.s40,
                  color: AppTheme.yellow,
                ),
              )
            : const SizedBox.shrink();
      }),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Obx(() {
                return SizedBox(
                  width: constraints.maxWidth,
                  child: PdfViewerPage(
                    title:
                        'Guia Prático para o Desenvolvimento de Roteiros Imagéticos Sinalizados',
                    path: Mock.guidePath,
                    pdfHeight: .85,
                    isVideoVisible: controller.isVideoVisible,
                  ),
                );
              }),
              Obx(() {
                if (controller.isVideoVisible) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: UiScale.s8),
                        child: FloatingActionButton(
                          mini: true,
                          onPressed: controller.showVideo,
                          backgroundColor: Colors.red.shade900,
                          hoverColor: Colors.red,
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            weight: 2.0,
                          ),
                        ),
                      ),
                      Container(
                        height: constraints.maxHeight * .35,
                        width: constraints.maxWidth,
                        margin: const EdgeInsets.all(UiScale.s8),
                        decoration: BoxDecoration(
                          color: AppTheme.darkBlue,
                          borderRadius: BorderRadius.circular(UiScale.s16),
                        ),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: controller.hasPrevPage
                                  ? controller.prevPage
                                  : null,
                              child: Icon(
                                Icons.keyboard_arrow_left_sharp,
                                size: UiScale.s48,
                                color: controller.hasPrevPage
                                    ? AppTheme.yellow
                                    : Colors.grey.shade300,
                              ),
                            ),
                            Expanded(
                              child: PageView.builder(
                                controller: controller.pageController,
                                onPageChanged: (index) =>
                                    controller.currentPage.value = index,
                                itemCount: controller.videoUrls.length,
                                itemBuilder: (context, index) {
                                  return ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(UiScale.s16),
                                    child: YoutubeVideoPlayer(
                                      videoUrl: controller.videoUrls[index],
                                      autoPlay: true,
                                    ),
                                  );
                                },
                              ),
                            ),
                            InkWell(
                              onTap: controller.hasNextPage
                                  ? controller.nextPage
                                  : null,
                              child: Icon(
                                Icons.keyboard_arrow_right_sharp,
                                size: UiScale.s48,
                                color: controller.hasNextPage
                                    ? AppTheme.yellow
                                    : Colors.grey.shade300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
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
