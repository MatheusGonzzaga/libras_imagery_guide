import 'package:get/get.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubeVideoPlayerController extends GetxController {
  late final YoutubePlayerController controller;
  final Rxn<String> videoUrl = Rxn<String>();
  final RxBool _autoPlay = false.obs;
  final RxBool _mute = true.obs;

  YoutubeVideoPlayerController(String initialUrl,
      {bool? autoPlay, bool? mute}) {
    videoUrl.value = initialUrl;
    _autoPlay.value = autoPlay ?? false;
    _mute.value = mute ?? true;
    _initializePlayer();
  }

  void _initializePlayer() {
    controller = YoutubePlayerController(
      params: YoutubePlayerParams(
        mute: _mute(),
        showFullscreenButton: false,
        showVideoAnnotations: false,
      ),
    );
    _loadVideo();
    ever(_mute, (_) => _updateVolume());
  }

  void _loadVideo() {
    final videoId =
        YoutubePlayerController.convertUrlToId(videoUrl.value ?? "");
    if (videoId != null) {
      controller.loadVideoById(videoId: videoId);
      if (_autoPlay.value) controller.playVideo();
    } else {
      controller.stopVideo();
    }
  }

  void updateVideoUrl(String newUrl) {
    videoUrl.value = newUrl;
    _loadVideo();
  }

  void toggleMute() {
    _mute.value = !_mute.value;
  }

  void _updateVolume() {
    if (_mute.value) {
      controller.setVolume(0);
    } else {
      controller.setVolume(100);
    }
  }

  @override
  void onClose() {
    controller.close();
    super.onClose();
  }
}
