import 'package:flutter/material.dart';

import 'package:libras_imagery_guide/application/ui/theme_config.dart';
import 'package:libras_imagery_guide/application/ui/ui_scale.dart';
import 'package:pdfrx/pdfrx.dart';
import 'package:url_launcher/url_launcher.dart';

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

  Future<void> _downloadPdf() async {
    final Uri url = Uri.parse(
        "https://drive.google.com/file/d/1I-qj0m1hWToeEG6pEtejOzVgqnm3Kyy4/view");

    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw "Não foi possível abrir o link";
    }
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
                  onPressed: () async => await _downloadPdf(),
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
