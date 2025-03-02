import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class PlatformUtils extends GetxController {
  late final bool _isWeb;
  late final bool _isMobile;
  late final double _width;

  PlatformUtils(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    _width = mediaQuery.size.width;

    _isWeb = _width > 600;
    _isMobile = _width <= 600;
  }

  bool get isMobile => _isMobile;
  bool get isWeb => _isWeb;
  double get width => _width;
}
