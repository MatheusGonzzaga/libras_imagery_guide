import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:libras_imagery_guide/application/ui/platform_utils/platform_utils.dart';
import 'package:libras_imagery_guide/application/ui/theme_config.dart';
import 'package:libras_imagery_guide/application/ui/ui_scale.dart';
import 'package:libras_imagery_guide/mock.dart';
import 'package:libras_imagery_guide/shared/youtube_video_player/youtube_video_player.dart';

part 'platform/splash_mobile_page.dart';
part 'platform/splash_web_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final platformUtils = Get.find<PlatformUtils>();
    if (platformUtils.isWeb) return const SplashWebPage();
    return const SplashMobilePage();
  }
}
