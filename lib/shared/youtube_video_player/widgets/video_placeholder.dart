import 'package:flutter/material.dart';
import 'package:libras_imagery_guide/application/ui/theme_config.dart';
import 'package:libras_imagery_guide/application/ui/ui_scale.dart';
import 'package:libras_imagery_guide/application/ui/ui_text.dart';

class VideoPlaceholder extends StatelessWidget {
  const VideoPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: UiScale.s8,
        horizontal: UiScale.s16,
      ),
      decoration: BoxDecoration(
        color: AppTheme.darkBlue,
        borderRadius: BorderRadius.circular(
          UiScale.s16,
        ),
      ),
      child: Column(
        children: [
          const Spacer(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: UiScale.s40),
            child: Text(
              UiText.clickWord,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: UiScale.s24,
                color: Colors.white,
              ),
            ),
          ),
          Image.asset(
            'assets/logo/logo.png',
            fit: BoxFit.contain,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
