import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libras_imagery_guide/application/ui/platform_utils/platform_utils.dart';
import 'package:libras_imagery_guide/application/ui/theme_config.dart';
import 'package:libras_imagery_guide/application/ui/ui_scale.dart';
import 'package:libras_imagery_guide/mock.dart';
import 'package:libras_imagery_guide/modules/guide/guide_controller.dart';
import 'package:libras_imagery_guide/shared/pdf_viewer/pdf_viewer.dart';
import 'package:libras_imagery_guide/shared/youtube_video_player/youtube_video_player.dart';

part 'platform/guide_mobile_page.dart';
part 'platform/guide_web_page.dart';

class GuidePage extends StatelessWidget {
  const GuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    final platformUtils = Get.find<PlatformUtils>();
    if (platformUtils.isWeb) return const GuideWebPage();
    return const GuideMobilePage();
  }
}
