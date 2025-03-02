import 'package:flutter/material.dart';
import 'package:libras_imagery_guide/application/ui/theme_config.dart';

class VideoScaleButtonWrapper extends StatelessWidget {
  final bool isExpanded;
  final void Function() onResize;
  final Widget child;
  const VideoScaleButtonWrapper({
    super.key,
    required this.isExpanded,
    required this.onResize,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return isExpanded
        ? Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: FloatingActionButton(
                  mini: true,
                  backgroundColor: AppTheme.blue,
                  onPressed: () => onResize.call(),
                  child: Icon(
                    Icons.close_fullscreen_sharp,
                    color: AppTheme.white,
                  ),
                ),
              ),
              child,
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: FloatingActionButton(
                  mini: true,
                  backgroundColor: AppTheme.blue,
                  onPressed: () => onResize.call(),
                  child: Icon(
                    Icons.open_in_full_sharp,
                    color: AppTheme.white,
                  ),
                ),
              ),
              child,
            ],
          );
  }
}
