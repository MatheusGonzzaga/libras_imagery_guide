import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin MessagesMixin on GetxController {
  void messageListener(Rxn<MessageModel> message) {
    ever<MessageModel?>(message, (model) {
      if (model != null) {
        Get.snackbar(
          model.title,
          model.message,
          backgroundColor: model.type.color(),
        );
      }
    });
  }
}

enum MessageType { info, error }

extension MessageTypeExtension on MessageType {
  Color color() {
    switch (this) {
      case MessageType.error:
        return Colors.red;
      case MessageType.info:
        return Colors.blue;
    }
  }
}

class MessageModel {
  final String title;
  final String message;
  final MessageType type;

  MessageModel.info({
    required this.title,
    required this.message,
  }) : type = MessageType.info;

  MessageModel.error({
    required this.title,
    required this.message,
  }) : type = MessageType.error;
}
