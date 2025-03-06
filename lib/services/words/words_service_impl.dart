import 'package:libras_imagery_guide/models/word_model.dart';
import 'package:libras_imagery_guide/repositories/words/words_repository.dart';
import 'package:libras_imagery_guide/services/words/words_service.dart';

class WordsServiceImpl implements WordsService {
  final WordsRepository _wordsRepository;

  WordsServiceImpl({
    required WordsRepository wordsRepository,
  }) : _wordsRepository = wordsRepository;

  @override
  Future<List<WordModel>> getWords({List<int>? ids}) async {
    final words = await _wordsRepository.getWords(ids: ids);

    words.sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));

    return words;
  }
}
