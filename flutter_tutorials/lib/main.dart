import 'package:flutter/material.dart';
import 'package:flutter_tutorials/login_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const GetMaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GetX Form Validation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
