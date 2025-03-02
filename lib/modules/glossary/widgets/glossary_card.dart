import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libras_imagery_guide/application/ui/theme_config.dart';
import 'package:libras_imagery_guide/application/ui/ui_scale.dart';
import 'package:libras_imagery_guide/models/word_model.dart';
import 'package:libras_imagery_guide/modules/glossary/glossary_controller.dart';

class GlossaryCard extends GetView<GlossaryController> {
  final WordModel word;
  final Function() onTap;
  const GlossaryCard({
    super.key,
    required this.word,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final selectedWord = controller.selectedWord;
      return Card(
        margin: const EdgeInsets.symmetric(
          vertical: UiScale.s8,
          horizontal: UiScale.s16,
        ),
        color: AppTheme.darkBlue,
        child: SizedBox(
          width: Get.width,
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(UiScale.s8),
            ),
            hoverColor: AppTheme.darkBlue.withOpacity(.1),
            onTap: onTap,
            title: Text(
              word.name,
              style: TextStyle(
                color: selectedWord == word ? AppTheme.yellow : AppTheme.blue,
                fontSize: UiScale.s24,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              word.meaning,
              style: TextStyle(
                color: AppTheme.white,
                fontSize: UiScale.s16,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: selectedWord == word
                ? Icon(
                    Icons.pause_circle,
                    size: UiScale.s48,
                    color: AppTheme.yellow,
                  )
                : Icon(
                    Icons.play_circle,
                    size: UiScale.s48,
                    color: AppTheme.blue,
                  ),
          ),
        ),
      );
    });
  }
}
