import 'package:flutter_tutorials/utils/exports.dart';

goHome() async {
  Navigator.push(
    navigatorKey.currentContext!,
    MaterialPageRoute(
      builder: (context) => const SuccessScreen(),
    ),
  );
}
