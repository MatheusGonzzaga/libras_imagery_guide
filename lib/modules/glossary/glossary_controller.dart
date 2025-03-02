import 'dart:async';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:libras_imagery_guide/application/ui/loader/loader_mixin.dart';
import 'package:libras_imagery_guide/application/ui/messages/messages_mixin.dart';
import 'package:libras_imagery_guide/models/word_model.dart';
import 'package:libras_imagery_guide/services/words/words_service.dart';

class GlossaryController extends GetxController
    with LoaderMixin, MessagesMixin {
  final WordsService _wordsService;

  GlossaryController({
    required WordsService wordsService,
  }) : _wordsService = wordsService;

  final _wordsOriginal = <WordModel>[].obs;

  final _words = <WordModel>[].obs;
  List<WordModel> get words => _words();

  final _selectedWord = Rxn<WordModel>();
  WordModel? get selectedWord => _selectedWord();
  final video = Rxn<String>();

  final _videoScale = Rx<Size>(const Size(.5, .4));
  Size get videoScale => _videoScale();

  bool get isExpanded => videoScale == _expandedSize;

  final _initialSize = const Size(.5, .4);
  final _expandedSize = const Size(1, .5);

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

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
      final resultWords = await _wordsService.getWords();
      _words.assignAll(resultWords);
      _wordsOriginal.assignAll(resultWords);
    } catch (e, _) {
      _message(MessageModel.error(
        title: 'Erro',
        message: 'Erro carregar dados das palavras',
      ));
    }
  }

  void searching(String? search) {
    if (search != null && search != '') {
      final listWords = _wordsOriginal.where((word) {
        return word.name.toLowerCase().contains(search);
      }).toList();
      _words.assignAll(listWords);
    } else {
      _words.assignAll(_wordsOriginal);
    }
  }

  void selectWord(WordModel word) {
    _selectedWord.value = word;
    video.value = word.video;
  }

  void changeVideoScale() {
    if (_videoScale.value == _initialSize) {
      _videoScale.value = _expandedSize;
    } else {
      _videoScale.value = _initialSize;
    }
  }
}
