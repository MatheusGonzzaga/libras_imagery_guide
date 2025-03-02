part of '../roadmap_page.dart';

class RoadmapMobilePage extends StatelessWidget {
  final RoadmapModel roadmap;
  const RoadmapMobilePage({
    super.key,
    required this.roadmap,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RoadmapController(roadmap: roadmap));
    return Scaffold(
      backgroundColor: AppTheme.darkBlue,
      body: Padding(
        padding: const EdgeInsets.all(UiScale.s16),
        child: LayoutBuilder(builder: (context, constraints) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(UiScale.s16),
            ),
            height: constraints.maxHeight,
            child: Column(
              children: [
                SizedBox(
                  height: constraints.maxHeight * .06,
                  child: Row(
                    children: [
                      SizedBox(
                        width: UiScale.s56,
                        child: FloatingActionButton(
                          backgroundColor: Colors.red.shade900,
                          hoverColor: Colors.red,
                          onPressed: () => Navigator.pop(context),
                          mini: true,
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            weight: 2.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: UiScale.s4),
                          decoration: BoxDecoration(
                            color: AppTheme.darkBlue,
                            borderRadius: BorderRadius.circular(UiScale.s16),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            roadmap.title.toUpperCase(),
                            style: GoogleFonts.assistant(
                              fontSize:
                                  UiScale.scaleSize(constraints, UiScale.s56),
                              color: AppTheme.yellow,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: UiScale.s56,
                        margin: const EdgeInsets.symmetric(
                          horizontal: UiScale.s8,
                          vertical: UiScale.s4,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.darkBlue,
                          borderRadius: BorderRadius.circular(UiScale.s16),
                        ),
                        child: Center(
                          child: Obx(() {
                            return Text(
                              '${controller.currentPage() + 1}/${controller.totalPages}',
                              style: GoogleFonts.assistant(
                                fontSize:
                                    UiScale.scaleSize(constraints, UiScale.s56),
                                color: AppTheme.white,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: PageView(
                          controller: controller.pageController,
                          onPageChanged: (index) =>
                              controller.currentPage.value = index,
                          children: roadmap.steps
                              .map((step) => RoadmapMobileStepView(step: step))
                              .toList(),
                        ),
                      ),
                      SizedBox(
                        height: UiScale.s64,
                        width: constraints.maxWidth * .8,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: UiScale.s16),
                          child: RoadmapControllerButtons(
                            controller: controller,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
