import 'package:libras_imagery_guide/models/word_model.dart';

abstract interface class WordsService {
  Future<List<WordModel>> getWords({List<int> ids});
}
