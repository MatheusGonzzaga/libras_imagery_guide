import 'package:flutter/material.dart';
import 'package:libras_imagery_guide/application/ui/theme_config.dart';
import 'package:libras_imagery_guide/application/ui/ui_scale.dart';
import 'package:libras_imagery_guide/models/simple_model.dart';

class FilterTag extends StatelessWidget {
  final SimpleModel model;
  final bool selected;
  final VoidCallback onPressed;
  const FilterTag({
    super.key,
    required this.model,
    this.selected = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(UiScale.s4),
        padding: const EdgeInsets.symmetric(
          horizontal: UiScale.s8,
          vertical: UiScale.s4,
        ),
        constraints: const BoxConstraints(
          minWidth: UiScale.s104,
          minHeight: UiScale.s32,
        ),
        decoration: BoxDecoration(
          color: selected ? AppTheme.yellow : AppTheme.darkBlue,
          borderRadius: BorderRadius.circular(UiScale.s104),
        ),
        child: Center(
          child: Text(
            model.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: selected ? AppTheme.darkBlue : AppTheme.offWhite,
              fontSize: UiScale.s16,
            ),
          ),
        ),
      ),
    );
  }
}
