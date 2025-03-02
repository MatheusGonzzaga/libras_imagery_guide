import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin LoaderMixin on GetxController {
  void loaderListener(RxBool loaderRx, {Widget? loader}) {
    ever<bool>(loaderRx, (loading) async {
      if (loading) {
        await Get.dialog(
          loader ?? const Center(child: CircularProgressIndicator()),
          barrierDismissible: false,
        );
      } else {
        Get.back();
      }
    });
  }
}
