import 'package:get/get.dart';
import 'package:libras_imagery_guide/application/ui/loader/loader_mixin.dart';
import 'package:libras_imagery_guide/application/ui/messages/messages_mixin.dart';
import 'package:libras_imagery_guide/models/roadmap_model.dart';
import 'package:libras_imagery_guide/models/simple_model.dart';
import 'package:libras_imagery_guide/services/epochs/epochs_service.dart';
import 'package:libras_imagery_guide/services/genres/genres_service.dart';
import 'package:libras_imagery_guide/services/roadmaps/roadmaps_service.dart';

class RoadmapsController extends GetxController
    with LoaderMixin, MessagesMixin {
  final EpochsService _epochsService;
  final GenresService _genresService;
  final RoadmapsService _roadmapsService;
  RoadmapsController({
    required EpochsService epochsService,
    required GenresService genresService,
    required RoadmapsService roadmapsService,
  })  : _epochsService = epochsService,
        _genresService = genresService,
        _roadmapsService = roadmapsService;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  final genres = <SimpleModel>[].obs;
  final genreSelected = Rxn<SimpleModel>();

  final _epochs = <SimpleModel>[].obs;
  List<SimpleModel> get epochs => _epochs();

  final _roadmaps = <RoadmapModel>[].obs;
  List<RoadmapModel> get roadmaps => _roadmaps();
  var _roadmapsOriginal = <RoadmapModel>[];

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      final resultGenres = await _genresService.getGenres();
      genres.assignAll(resultGenres);
      final resultEpochs = await _epochsService.getEpochs();
      _epochs.assignAll(resultEpochs);
      await getRoadmaps();
    } catch (e, _) {
      _message(MessageModel.error(
        title: 'Erro',
        message: 'Erro carregar dados da pagina',
      ));
    }
  }

  Future<void> getRoadmaps() async {
    try {
      var result = await _roadmapsService.getRoadmaps();
      _roadmaps.assignAll(result);
      _roadmapsOriginal = result;
    } catch (e, _) {
      _message(MessageModel.error(
        title: 'Erro',
        message: 'Erro carregar dados da pagina',
      ));
    }
  }

  void filterByGenre(SimpleModel? genreModel) {
    if (genreModel?.id == genreSelected.value?.id) {
      genreModel = null;
    }

    genreSelected.value = genreModel;

    if (genreModel != null) {
      var newRoadmaps = _roadmapsOriginal.where((movie) {
        return movie.genres.contains(genreModel?.id);
      });

      _roadmaps.assignAll(newRoadmaps);
    } else {
      _roadmaps.assignAll(_roadmapsOriginal);
    }
  }
}
