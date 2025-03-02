import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:libras_imagery_guide/application/ui/platform_utils/platform_utils.dart';
import 'package:libras_imagery_guide/application/ui/theme_config.dart';
import 'package:libras_imagery_guide/application/ui/ui_scale.dart';
import 'package:libras_imagery_guide/modules/about/about_controller.dart';
import 'package:libras_imagery_guide/modules/about/platform/about_mobile_page.dart';
import 'package:libras_imagery_guide/modules/about/widgets/about_card/about_web_card.dart';
import 'package:libras_imagery_guide/modules/about/widgets/author_card/author_web_card.dart';
import 'package:libras_imagery_guide/shared/youtube_video_player/youtube_video_player.dart';
import 'package:libras_imagery_guide/shared/youtube_video_player/widgets/video_placeholder.dart';

part 'platform/about_web_page.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final platformUtils = Get.find<PlatformUtils>();
    if (platformUtils.isWeb) return const AboutWebPage();
    return const AboutMobilePage();
  }
}
