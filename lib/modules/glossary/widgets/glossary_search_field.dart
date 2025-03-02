import 'package:flutter/material.dart';
import 'package:libras_imagery_guide/application/ui/theme_config.dart';
import 'package:libras_imagery_guide/application/ui/ui_scale.dart';
import 'package:libras_imagery_guide/application/ui/ui_text.dart';

class GlossarySearchField extends StatelessWidget {
  final void Function(String) onChanged;
  const GlossarySearchField({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hoverColor: AppTheme.darkBlue.withOpacity(.7),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: UiScale.s8),
          child: Icon(
            Icons.search,
            color: AppTheme.white,
          ),
        ),
        label: Text(
          UiText.searchWord.toUpperCase(),
          style: TextStyle(
            color: AppTheme.white.withOpacity(.5),
            fontWeight: FontWeight.bold,
          ),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: UiScale.s4),
          child: IconButton(
            icon: Icon(
              Icons.close,
              size: UiScale.s16,
              color: AppTheme.white,
            ),
            onPressed: () {
              controller.clear();
              onChanged.call('');
            },
          ),
        ),
        filled: true,
        fillColor: AppTheme.darkBlue,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: AppTheme.darkBlue.withOpacity(.2),
          ),
          borderRadius: BorderRadius.circular(
            UiScale.s80,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: AppTheme.darkBlue.withOpacity(.5),
          ),
          borderRadius: BorderRadius.circular(
            UiScale.s80,
          ),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
