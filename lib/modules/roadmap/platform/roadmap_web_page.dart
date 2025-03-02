part of '../roadmap_page.dart';

class RoadmapWebPage extends StatelessWidget {
  final RoadmapModel roadmap;
  const RoadmapWebPage({
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: UiScale.s64,
                  ).add(
                    const EdgeInsets.only(top: UiScale.s12),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: constraints.maxWidth * .04,
                        height: constraints.maxHeight * .06,
                        child: FloatingActionButton.extended(
                          backgroundColor: Colors.red.shade900,
                          hoverColor: Colors.red,
                          onPressed: () => Navigator.pop(context),
                          label: const Icon(
                            Icons.close,
                            color: Colors.white,
                            weight: 2.0,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: constraints.maxHeight * .06,
                          decoration: BoxDecoration(
                            color: AppTheme.darkBlue,
                            borderRadius: BorderRadius.circular(UiScale.s16),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            roadmap.title.toUpperCase(),
                            style: GoogleFonts.assistant(
                              fontSize: UiScale.scaleSize(constraints, 24),
                              color: AppTheme.yellow,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: constraints.maxWidth * .04,
                        height: constraints.maxHeight * .06,
                        margin:
                            const EdgeInsets.symmetric(horizontal: UiScale.s12),
                        decoration: BoxDecoration(
                          color: AppTheme.darkBlue,
                          borderRadius: BorderRadius.circular(UiScale.s16),
                        ),
                        child: Center(
                          child: Obx(() {
                            return Text(
                              '${controller.currentPage() + 1}/${controller.totalPages}',
                              style: GoogleFonts.assistant(
                                fontSize: UiScale.scaleSize(constraints, 20),
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
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      PageView(
                        controller: controller.pageController,
                        onPageChanged: (index) =>
                            controller.currentPage.value = index,
                        children: roadmap.steps
                            .map((step) => RoadmapWebStepView(step: step))
                            .toList(),
                      ),
                      RoadmapControllerButtons(
                        controller: controller,
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
