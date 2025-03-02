import 'package:flutter/material.dart';
import 'package:libras_imagery_guide/application/ui/theme_config.dart';
import 'package:libras_imagery_guide/application/ui/ui_scale.dart';
import 'package:libras_imagery_guide/models/author_model.dart';

class AuthorWebCard extends StatelessWidget {
  final AuthorModel author;

  const AuthorWebCard({
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: UiScale.s184,
                      width: UiScale.s160,
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
                    const SizedBox(width: UiScale.s16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            horizontalTitleGap: 0,
                            contentPadding: const EdgeInsets.only(
                              right: UiScale.s8,
                            ),
                            title: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: UiScale.s16),
                              child: Text(
                                author.name,
                                style: TextStyle(
                                  color: AppTheme.blue,
                                  fontSize: UiScale.s24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            subtitle: Text(
                              author.description,
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
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
