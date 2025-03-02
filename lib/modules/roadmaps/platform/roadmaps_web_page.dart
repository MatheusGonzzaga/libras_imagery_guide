part of '../roadmaps_page.dart';

class RoadmapsWebPage extends GetView<RoadmapsController> {
  const RoadmapsWebPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppTheme.offWhite,
      body: SingleChildScrollView(
        child: Obx(() {
          return Padding(
            padding: const EdgeInsets.only(
              top: UiScale.s16,
              left: UiScale.s16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const RoadmapsFilters(),
                ...controller.epochs.map(
                  (epoch) {
                    final roadmaps = List<RoadmapModel>.from(
                      controller.roadmaps.where((g) => g.epoch == epoch.id),
                    );
                    if (roadmaps.isNotEmpty) {
                      return RoadmapsGroup(
                        // title: epoch.name,
                        roadmaps: roadmaps,
                      );
                    }
                    return const SizedBox.shrink();
                  },
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
