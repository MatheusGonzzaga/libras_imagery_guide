import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libras_imagery_guide/application/ui/platform_utils/platform_utils.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import 'youtube_video_player_controller.dart';

part 'platform/youtube_video_mobile_player.dart';
part 'platform/youtube_video_web_player.dart';

class YoutubeVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final bool? autoPlay;
  final bool? mute;

  const YoutubeVideoPlayer({
    required this.videoUrl,
    this.autoPlay,
    this.mute,
    super.key,
  });

  @override
  State<YoutubeVideoPlayer> createState() => _YoutubeVideoPlayerState();
}

class _YoutubeVideoPlayerState extends State<YoutubeVideoPlayer> {
  late YoutubeVideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(
      YoutubeVideoPlayerController(
        widget.videoUrl,
        autoPlay: widget.autoPlay,
        mute: widget.mute,
      ),
      tag: widget.videoUrl,
    );
  }

  @override
  void dispose() {
    Get.delete<YoutubeVideoPlayerController>(tag: widget.videoUrl);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final platformUtils = Get.find<PlatformUtils>();

    if (controller.videoUrl.value != widget.videoUrl) {
      controller.updateVideoUrl(widget.videoUrl);
    }

    // ignore: unnecessary_null_comparison
    if (controller.controller == null) {
      return const Center(
        child: Text('Invalid video URL'),
      );
    }

    if (platformUtils.isWeb) {
      return YoutubeVideoWebPlayer(youtubeController: controller.controller);
    }
    return YoutubeVideoMobilePlayer(youtubeController: controller.controller);
  }
}
