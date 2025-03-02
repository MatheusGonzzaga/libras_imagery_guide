part of '../youtube_video_player.dart';

class YoutubeVideoWebPlayer extends GetView<YoutubeVideoPlayerController> {
  final YoutubePlayerController? youtubeController;
  const YoutubeVideoWebPlayer({
    required this.youtubeController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (youtubeController == null) {
      return const Center(
        child: Text('No video selected'),
      );
    }
    return YoutubePlayer(
      controller: youtubeController!,
      backgroundColor: Colors.transparent,
    );
  }
}
