import 'package:get/get.dart';
import 'package:libras_imagery_guide/modules/roadmaps/roadmaps_controller.dart';
import 'package:libras_imagery_guide/repositories/epochs/epochs_repository.dart';
import 'package:libras_imagery_guide/repositories/epochs/epochs_repository_impl.dart';
import 'package:libras_imagery_guide/repositories/genres/genres_repository.dart';
import 'package:libras_imagery_guide/repositories/genres/gerens_repository_impl.dart';
import 'package:libras_imagery_guide/repositories/roadmaps/roadmaps_repository.dart';
import 'package:libras_imagery_guide/repositories/roadmaps/roadmaps_repository_impl.dart';
import 'package:libras_imagery_guide/services/epochs/epochs_service.dart';
import 'package:libras_imagery_guide/services/epochs/epochs_service_impl.dart';
import 'package:libras_imagery_guide/services/genres/genres_service.dart';
import 'package:libras_imagery_guide/services/genres/genres_service_impl.dart';
import 'package:libras_imagery_guide/services/roadmaps/roadmaps_service.dart';
import 'package:libras_imagery_guide/services/roadmaps/roadmaps_service_impl.dart';

class RoadmapsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EpochsRepository>(
      () => EpochsRepositoryImpl(),
    );
    Get.lazyPut<EpochsService>(
      () => EpochsServiceImpl(epochsRepository: Get.find()),
    );
    Get.lazyPut<GenresRepository>(
      () => GenresRepositoryImpl(),
    );
    Get.lazyPut<GenresService>(
      () => GenresServiceImpl(genresRepository: Get.find()),
    );
    Get.lazyPut<RoadmapsRepository>(
      () => RoadmapsRepositoryImpl(),
    );
    Get.lazyPut<RoadmapsService>(
      () => RoadmapsServiceImpl(roadmapsRepository: Get.find()),
    );
    Get.lazyPut(
      () => RoadmapsController(
        epochsService: Get.find(),
        genresService: Get.find(),
        roadmapsService: Get.find(),
      ),
    );
  }
}
