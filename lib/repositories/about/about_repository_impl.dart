import 'package:libras_imagery_guide/mock.dart';
import 'package:libras_imagery_guide/models/about_model.dart';
import 'package:libras_imagery_guide/models/author_model.dart';
import 'package:libras_imagery_guide/repositories/about/about_repository.dart';

class AboutRepositoryImpl implements AboutRepository {
  @override
  Future<List<AboutModel>> getAbouts() async {
    final result = List<AboutModel>.from(
      Mock.abouts.map((w) => AboutModel.fromMap(w)),
    );
    return result;
  }

  @override
  Future<List<AuthorModel>> getAuthors() async {
    final result = List<AuthorModel>.from(
      Mock.authors.map((w) => AuthorModel.fromMap(w)),
    );
    return result;
  }
}
