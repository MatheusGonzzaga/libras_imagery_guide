import 'package:get/get.dart';
import 'package:libras_imagery_guide/application/ui/loader/loader_mixin.dart';
import 'package:libras_imagery_guide/application/ui/messages/messages_mixin.dart';
import 'package:libras_imagery_guide/models/about_model.dart';
import 'package:libras_imagery_guide/models/author_model.dart';
import 'package:libras_imagery_guide/services/about/about_service.dart';

class AboutController extends GetxController with LoaderMixin, MessagesMixin {
  final AboutService _aboutService;

  AboutController({
    required AboutService aboutService,
  }) : _aboutService = aboutService;

  final _abouts = <AboutModel>[].obs;
  List<AboutModel> get abouts => _abouts();

  final _authors = <AuthorModel>[].obs;
  List<AuthorModel> get authors => _authors();

  final _video = Rxn<String>();
  String? get video => _video();

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
      final resultAbout = await _aboutService.getAbouts();
      _abouts.assignAll(resultAbout);

      final resultAuthor = await _aboutService.getAuthors();
      _authors.assignAll(resultAuthor);
    } catch (e, _) {
      _message(MessageModel.error(
        title: 'Erro',
        message: 'Erro carregar dados da pagina sobre',
      ));
    }
  }

  void selectAboutVideo(AboutModel about) {
    if (_video.value == about.videoUrl) {
      _clearVideo();
    } else {
      _clearVideo();
      Future.delayed(const Duration(milliseconds: 300), () {
        _video.value = about.videoUrl;
      });
    }
  }

  void _clearVideo() {
    _video.value = null;
    _video.refresh();
  }
}
