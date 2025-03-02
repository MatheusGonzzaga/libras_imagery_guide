import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libras_imagery_guide/modules/roadmaps/roadmaps_controller.dart';
import 'package:libras_imagery_guide/modules/roadmaps/widgets/filters/filter_tag.dart';

class RoadmapsFilters extends GetView<RoadmapsController> {
  const RoadmapsFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(
        () => Row(
          children: controller.genres
              .map(
                (g) => FilterTag(
                  model: g,
                  onPressed: () => controller.filterByGenre(g),
                  selected: controller.genreSelected.value?.id == g.id,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
