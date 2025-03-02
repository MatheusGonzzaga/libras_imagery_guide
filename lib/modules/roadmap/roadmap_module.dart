import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libras_imagery_guide/application/modules/module.dart';
import 'package:libras_imagery_guide/models/roadmap_model.dart';
import 'package:libras_imagery_guide/modules/roadmap/roadmap_page.dart';

class RoadmapModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/roadmap',
      page: () {
        final roadmap = Get.arguments as RoadmapModel?;

        if (roadmap == null) {
          Future.microtask(() => Get.offNamed('/home'));
          return Container();
        }

        return RoadmapPage(roadmap: roadmap);
      },
    ),
  ];
}
