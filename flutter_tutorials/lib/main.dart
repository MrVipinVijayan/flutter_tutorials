import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_tutorials/my_extensions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Theme Extensions',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  VoidCallback demoCallback = () {
    log('Demo Function Called');
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Extend Functions'),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Text(
              'Hello Flutter',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                demoCallback.delayedCall(const Duration(seconds: 2));
                final validName = "Hello123".isValidName;
                validName.printObj();
                ExtendedString('Pizza').isValidName.printObj();
              },
              child: const Text('Tap'),
            ),
            Column(
              children: <Widget>[
                const Text(
                  'This is a simple example',
                ).p20(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
