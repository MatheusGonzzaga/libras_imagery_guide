import 'package:flutter/material.dart';
import 'package:libras_imagery_guide/application/ui/theme_config.dart';
import 'package:libras_imagery_guide/application/ui/ui_scale.dart';
import 'package:libras_imagery_guide/application/ui/ui_text.dart';

class AppUiConfig {
  AppUiConfig._();

  static String get title => 'Libras Guide';

  static ThemeData get theme => ThemeData(
        fontFamily: UiFont.Montserrat.name,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: TextStyle(
            color: Color(0xFF222222),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppTheme.darkBlue,
          shape: const CircleBorder(),
          hoverColor: AppTheme.blue,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            backgroundColor: AppTheme.white,
            foregroundColor: AppTheme.blue,
            side: BorderSide(
              color: AppTheme.darkBlue,
              width: 1.5,
            ),
            minimumSize: const Size(UiScale.s80, UiScale.s40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(UiScale.s24),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.darkBlue,
            side: BorderSide(
              color: AppTheme.offWhite,
            ),
            minimumSize: const Size(UiScale.s80, UiScale.s40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(UiScale.s24),
            ),
          ),
        ),
      );
}
