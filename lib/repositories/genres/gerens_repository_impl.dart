import 'package:libras_imagery_guide/mock.dart';
import 'package:libras_imagery_guide/models/simple_model.dart';

import 'genres_repository.dart';

class GenresRepositoryImpl implements GenresRepository {
  @override
  Future<List<SimpleModel>> getGenres() async {
    final result =
        List<SimpleModel>.from(Mock.genres.map((g) => SimpleModel.fromMap(g)));
    // await Future.delayed(Duration(seconds: 3), () {});
    return result;
  }
}
