// ignore_for_file: use_build_context_synchronously

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arhitect/presentation/common/app_colors.dart';

class Toast {
  static final Toast _toast = Toast._internal();

  Flushbar? _flushbar;

  factory Toast() {
    return _toast;
  }

  Toast._internal();

  Future<void> show({
    required BuildContext context,
    required String message,
    bool isError = false,
  }) async {
    if (_flushbar != null) {
      await _dismissToast();
    }
    _flushbar = Flushbar(
      flushbarStyle: FlushbarStyle.FLOATING,
      borderWidth: 2,
      backgroundColor: isError ? AppColors.darkBackground : AppColors.success,
      messageText: Text(message),
      mainButton: GestureDetector(
        onTap: _dismissToast,
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.all(8),
          child: const Icon(Icons.close),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      duration: const Duration(seconds: 3),
    )..show(context);
  }

  Future<void> _dismissToast() async {
    await _flushbar?.dismiss();
    _flushbar = null;
  }
}
