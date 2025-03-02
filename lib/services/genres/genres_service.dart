import 'package:libras_imagery_guide/models/simple_model.dart';

abstract interface class GenresService {
  Future<List<SimpleModel>> getGenres();
}
