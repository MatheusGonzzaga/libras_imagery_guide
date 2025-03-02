import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:libras_imagery_guide/application/ui/theme_config.dart';
import 'package:libras_imagery_guide/application/ui/ui_scale.dart';
import 'package:libras_imagery_guide/models/roadmap_step.dart';
import 'package:video_player/video_player.dart';

class RoadmapMobileStepView extends StatefulWidget {
  final RoadmapStep step;

  const RoadmapMobileStepView({
    super.key,
    required this.step,
  });

  @override
  State<RoadmapMobileStepView> createState() => _RoadmapMobileStepViewState();
}

class _RoadmapMobileStepViewState extends State<RoadmapMobileStepView> {
  late VideoPlayerController _videoController;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    _videoController = VideoPlayerController.asset(
      widget.step.video,
      videoPlayerOptions: VideoPlayerOptions(
        webOptions: const VideoPlayerWebOptions(
          controls: VideoPlayerWebOptionsControls.enabled(),
        ),
      ),
    );

    await _videoController.initialize();
    setState(() => _isInitialized = true);
    _videoController.setVolume(0);
    _videoController.play();
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
          return Column(
            children: [
              Container(
                height: constraints.maxHeight * .5,
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.step.image),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.circular(UiScale.s16),
                    border: Border.all(
                      color: AppTheme.darkBlue,
                      width: 2.0,
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: constraints.maxHeight * .48,
                    width: constraints.maxWidth * .5,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(UiScale.s16),
                    child: Text(
                      widget.step.description,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.assistant(
                        fontSize: UiScale.scaleSize(
                          constraints,
                          UiScale.s48,
                        ),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight * .48,
                    width: constraints.maxWidth * .5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(UiScale.s16),
                      child: _isInitialized
                          ? AspectRatio(
                              aspectRatio: 1.0,
                              child: VideoPlayer(_videoController),
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
