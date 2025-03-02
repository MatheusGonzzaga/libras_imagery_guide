import 'package:libras_imagery_guide/models/simple_model.dart';
import 'package:libras_imagery_guide/repositories/genres/genres_repository.dart';
import 'package:libras_imagery_guide/services/genres/genres_service.dart';

class GenresServiceImpl implements GenresService {
  final GenresRepository _genresRepository;

  GenresServiceImpl({
    required GenresRepository genresRepository,
  }) : _genresRepository = genresRepository;

  @override
  Future<List<SimpleModel>> getGenres() async =>
      await _genresRepository.getGenres();
}
