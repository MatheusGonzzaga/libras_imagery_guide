import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:libras_imagery_guide/application/ui/platform_utils/platform_utils.dart';
import 'package:libras_imagery_guide/application/ui/theme_config.dart';
import 'package:libras_imagery_guide/application/ui/ui_scale.dart';

class PrototypeCard extends StatelessWidget {
  const PrototypeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final platformUtils = Get.find<PlatformUtils>();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          margin: const EdgeInsets.symmetric(
            vertical: UiScale.s8,
            horizontal: UiScale.s16,
          ),
          color: AppTheme.darkBlue,
          child: Padding(
            padding: const EdgeInsets.all(UiScale.s8),
            child: ListTile(
              onTap: () {
                Get.toNamed('/prototype');
              },
              title: Text(
                'Prototipo Inicial',
                style: TextStyle(
                  fontSize: UiScale.scaleSize(constraints,
                      platformUtils.isWeb ? UiScale.s32 : UiScale.s64),
                  fontWeight: FontWeight.bold,
                  color: AppTheme.yellow,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: AppTheme.white,
                size: UiScale.s24,
              ),
            ),
          ),
        );
      },
    );
  }
}
