import 'package:flutter/material.dart';
import 'package:libras_imagery_guide/application/ui/ui_scale.dart';
import 'package:video_player/video_player.dart';

class PrototypeItem extends StatefulWidget {
  final String video;

  const PrototypeItem({
    super.key,
    required this.video,
  });

  @override
  State<PrototypeItem> createState() => _PrototypeItemState();
}

class _PrototypeItemState extends State<PrototypeItem> {
  late VideoPlayerController _videoController;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    _videoController = VideoPlayerController.asset(
      widget.video,
      videoPlayerOptions: VideoPlayerOptions(
        webOptions: const VideoPlayerWebOptions(
          controls: VideoPlayerWebOptionsControls.enabled(),
        ),
      ),
    );

    await _videoController.initialize();
    setState(() => _isInitialized = true);
    _videoController.setVolume(0);
    // _videoController.play();
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: UiScale.s8,
        vertical: UiScale.s12,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(UiScale.s16),
            ),
            child: _isInitialized
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(UiScale.s16),
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: VideoPlayer(_videoController),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        },
      ),
    );
  }
}
