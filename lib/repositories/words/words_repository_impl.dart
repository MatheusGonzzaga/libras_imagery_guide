import 'package:libras_imagery_guide/mock.dart';
import 'package:libras_imagery_guide/models/word_model.dart';
import 'package:libras_imagery_guide/repositories/words/words_repository.dart';

class WordsRepositoryImpl implements WordsRepository {
  @override
  Future<List<WordModel>> getWords({List<int>? ids}) async {
    final result =
        List<WordModel>.from(Mock.words.map((w) => WordModel.fromMap(w)));
    if (ids != null) {
      final filterResult =
          List<WordModel>.from(result.where((word) => ids.contains(word.id)));
      return filterResult;
    }
    return result;
  }
}
