import 'package:libras_imagery_guide/models/about_model.dart';
import 'package:libras_imagery_guide/models/author_model.dart';
import 'package:libras_imagery_guide/repositories/about/about_repository.dart';
import 'package:libras_imagery_guide/services/about/about_service.dart';

class AboutsServiceImpl implements AboutService {
  final AboutRepository _aboutRepository;

  AboutsServiceImpl({
    required AboutRepository aboutRepository,
  }) : _aboutRepository = aboutRepository;

  @override
  Future<List<AboutModel>> getAbouts() async {
    final abouts = await _aboutRepository.getAbouts();
    return abouts;
  }

  @override
  Future<List<AuthorModel>> getAuthors() async {
    final authors = await _aboutRepository.getAuthors();
    return authors;
  }
}
