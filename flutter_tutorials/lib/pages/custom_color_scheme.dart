import 'package:flutter/material.dart';

@immutable
class MyColors extends ThemeExtension<MyColors> {
  const MyColors({
    required this.success,
    required this.failure,
  });

  final Color? success;
  final Color? failure;

  @override
  MyColors copyWith({Color? success, Color? failure}) {
    return MyColors(
      success: success ?? this.success,
      failure: failure ?? this.failure,
    );
  }

  // Controls how the properties change on theme changes
  @override
  MyColors lerp(ThemeExtension<MyColors>? other, double t) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      success: Color.lerp(success, other.success, t),
      failure: Color.lerp(failure, other.failure, t),
    );
  }

  // Optional
  @override
  String toString() => 'MyColors(success: $success, failure: $failure)';

  // the light theme
  static const light = MyColors(
    success: Color(0xff28a745),
    failure: Color(0xffFFa2b8),
  );
  // the dark theme
  static const dark = MyColors(
    success: Color(0xff00bc8c),
    failure: Color(0xffC2C2C2),
  );
}
