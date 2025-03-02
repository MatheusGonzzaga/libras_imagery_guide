import 'package:flutter/material.dart';
import 'package:libras_imagery_guide/application/ui/theme_config.dart';
import 'package:libras_imagery_guide/application/ui/ui_scale.dart';
import 'package:libras_imagery_guide/models/author_model.dart';

class AuthorMobileCard extends StatelessWidget {
  final AuthorModel author;

  const AuthorMobileCard({
    super.key,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          margin: const EdgeInsets.symmetric(
            vertical: UiScale.s8,
            horizontal: UiScale.s16,
          ),
          color: AppTheme.darkBlue,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: UiScale.s16,
              vertical: UiScale.s16,
            ),
            child: Column(
              children: [
                Container(
                  height: UiScale.s128,
                  width: UiScale.s128,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppTheme.yellow,
                      width: UiScale.s4,
                    ),
                    borderRadius: BorderRadius.circular(UiScale.s120),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(UiScale.s120),
                    child: Image.asset(
                      author.image,
                      fit: BoxFit.cover,
                      height: constraints.maxWidth * 0.1,
                      width: constraints.maxWidth * 0.1,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: UiScale.s40),
                  child: Text(
                    author.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppTheme.yellow,
                      fontSize: UiScale.s24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: UiScale.s16),
                  child: Text(
                    author.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppTheme.white,
                      fontSize: UiScale.s16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
