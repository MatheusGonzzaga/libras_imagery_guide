// part of '../guide_page.dart';

// class GuideWebPage extends GetView<GuideController> {
//   const GuideWebPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       backgroundColor: AppTheme.offWhite,
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           return Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 width: constraints.maxWidth * .65,
//                 child: const PdfViewerPage(
//                   title:
//                       'Guia Prático para o Desenvolvimento de Roteiros Imagéticos Sinalizados',
//                   path: Mock.guidePath,
//                   pdfHeight: .92,
//                 ),
//               ),
//               SizedBox(
//                 height: constraints.maxHeight,
//                 width: constraints.maxWidth * .35,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                     vertical: UiScale.s8,
//                     horizontal: UiScale.s16,
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(
//                       UiScale.s16,
//                     ),
//                     child: const YoutubeVideoPlayer(videoUrl: ),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

part of '../guide_page.dart';

class GuideWebPage extends GetView<GuideController> {
  const GuideWebPage({super.key});

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
              SizedBox(
                width: constraints.maxWidth * .65,
                child: const PdfViewerPage(
                  title:
                      'Guia Prático para o Desenvolvimento de Roteiros Imagéticos Sinalizados',
                  path: Mock.guidePath,
                  pdfHeight: .9,
                  isVideoVisible: false,
                ),
              ),
              Obx(() {
                return Container(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth * .33,
                  margin: const EdgeInsets.all(UiScale.s8),
                  decoration: BoxDecoration(
                    color: AppTheme.darkBlue,
                    borderRadius: BorderRadius.circular(UiScale.s16),
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap:
                            controller.hasPrevPage ? controller.prevPage : null,
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
                            return YoutubeVideoPlayer(
                              videoUrl: controller.videoUrls[index],
                              autoPlay: index == controller.currentPage.value,
                            );
                          },
                        ),
                      ),
                      InkWell(
                        onTap:
                            controller.hasNextPage ? controller.nextPage : null,
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
                );
              }),
            ],
          );
        },
      ),
    );
  }
}
