import 'dart:developer';

import 'package:flutter/material.dart';

extension ExtendedString on String {
  bool get isValidName {
    return !contains(RegExp(r'[0–9]'));
  }
}

extension ExtendedVoidFunction on VoidCallback {
  Future<void> delayedCall(Duration duration) =>
      Future<void>.delayed(duration, this);
}

extension LogObj on Object {
  void printObj() {
    log(toString());
  }
}

extension PaddingExtension on Widget {
  p20() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: this,
    );
  }
}

extension PaddingExtension2 on Text {
  p20() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: this,
    );
  }
}
