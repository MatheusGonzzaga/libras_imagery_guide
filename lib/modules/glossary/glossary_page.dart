import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:libras_imagery_guide/application/ui/platform_utils/platform_utils.dart';
import 'package:libras_imagery_guide/application/ui/theme_config.dart';
import 'package:libras_imagery_guide/application/ui/ui_scale.dart';
import 'package:libras_imagery_guide/modules/glossary/glossary_controller.dart';
import 'package:libras_imagery_guide/modules/glossary/widgets/glossary_card.dart';
import 'package:libras_imagery_guide/modules/glossary/widgets/glossary_search_field.dart';
import 'package:libras_imagery_guide/modules/glossary/widgets/video_scale_button_wrapper.dart';
import 'package:libras_imagery_guide/shared/youtube_video_player/youtube_video_player.dart';
import 'package:libras_imagery_guide/shared/youtube_video_player/widgets/video_placeholder.dart';

part './platform/glossary_mobile_page.dart';
part './platform/glossary_web_page.dart';

class GlossaryPage extends GetView<GlossaryController> {
  const GlossaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final platformUtils = Get.find<PlatformUtils>();
    if (platformUtils.isWeb) return const GlossaryWebPage();
    return const GlossaryMobilePage();
  }
}
