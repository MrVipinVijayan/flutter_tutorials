import 'package:flutter/material.dart';
import 'package:flutter_tutorials/pages/home_page.dart';
import 'package:flutter_tutorials/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Theme Extensions',
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      // theme: ThemeData.light().copyWith(
      //   extensions: <ThemeExtension<dynamic>>[
      //     MyColors.light,
      //   ],
      // ),
      // darkTheme: ThemeData.dark().copyWith(
      //   extensions: <ThemeExtension<dynamic>>[
      //     MyColors.dark,
      //   ],
      // ),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const HomePage(),
    );
  }
}
