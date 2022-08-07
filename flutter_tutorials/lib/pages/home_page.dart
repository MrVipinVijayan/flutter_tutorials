import 'package:flutter/material.dart';

// Flutter Best Practices Tutorials can be found in the below links
// Flutter Best Practices - Part 1
// https://itnext.io/flutter-best-practices-part-1-e89467ea4823

// Flutter Best Practices - Part 2
// https://itnext.io/flutter-best-practices-part-2-e9e5c79ccb16

// Flutter Best Practices - Part 3
// https://itnext.io/flutter-best-practices-part-3-747f1bfaec6b

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
      ),
    );
  }
}
