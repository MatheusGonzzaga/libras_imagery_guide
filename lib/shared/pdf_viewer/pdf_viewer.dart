import 'package:flutter/material.dart';

import 'package:libras_imagery_guide/application/ui/theme_config.dart';
import 'package:libras_imagery_guide/application/ui/ui_scale.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:pdfrx/pdfrx.dart';

class PdfViewerPage extends StatelessWidget {
  final String title;
  final String path;
  final double pdfHeight;
  final bool isVideoVisible;

  const PdfViewerPage({
    super.key,
    required this.title,
    required this.path,
    required this.pdfHeight,
    required this.isVideoVisible,
  });

  void _downloadPdf() {
    html.window.open(path, path.split('/').last);
    // html.AnchorElement(href: path)
    //   ..setAttribute("download", path.split('/').last)
    //   ..click();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: UiScale.s8,
        horizontal: UiScale.s16,
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                tileColor: AppTheme.darkBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(UiScale.s8),
                ),
                title: Text(
                  title,
                  style: TextStyle(
                    color: AppTheme.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(
                    Icons.download,
                    color: AppTheme.white,
                  ),
                  onPressed: () => _downloadPdf(),
                ),
              ),
              const SizedBox(
                height: UiScale.s8,
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppTheme.darkBlue,
                  borderRadius: BorderRadius.circular(UiScale.s8),
                ),
                padding: const EdgeInsets.all(UiScale.s8),
                height: constraints.maxHeight * pdfHeight,
                child: PdfViewer.asset(
                  path,
                  params: PdfViewerParams(
                    scrollByMouseWheel: 3.0,
                    backgroundColor: AppTheme.darkBlue,
                  ),
                ),
              ),
              if (isVideoVisible)
                SizedBox(
                  height: constraints.maxHeight * .35,
                )
            ],
          ),
        );
      }),
    );
  }
}
