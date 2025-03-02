part of '../roadmaps_page.dart';

class RoadmapsMobilePage extends GetView<RoadmapsController> {
  const RoadmapsMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.offWhite,
      body: SingleChildScrollView(
        child: Obx(
          () {
            return Padding(
              padding: const EdgeInsets.all(UiScale.s16),
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
          },
        ),
      ),
    );
  }
}
