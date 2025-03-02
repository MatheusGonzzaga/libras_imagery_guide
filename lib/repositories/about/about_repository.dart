import 'package:libras_imagery_guide/models/about_model.dart';
import 'package:libras_imagery_guide/models/author_model.dart';

abstract interface class AboutRepository {
  Future<List<AboutModel>> getAbouts();
  Future<List<AuthorModel>> getAuthors();
}
