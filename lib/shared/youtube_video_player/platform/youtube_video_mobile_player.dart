part of '../youtube_video_player.dart';

class YoutubeVideoMobilePlayer extends StatelessWidget {
  final YoutubePlayerController? youtubeController;
  const YoutubeVideoMobilePlayer({
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
    );
  }
}
