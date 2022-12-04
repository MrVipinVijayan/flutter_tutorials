import 'package:flutter/material.dart';
import 'package:flutter_tutorials/extensions/my_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  bool _failure = false;

  @override
  Widget build(BuildContext context) {
    final myColors = Theme.of(context).extension<MyColors>()!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Theme Extensions'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Text(
              'Hello Flutter',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 30),
            Container(
              width: 200,
              height: 200,
              color: _failure ? myColors.failure : myColors.success,
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                setState(() {
                  _failure = !_failure;
                });
              },
              child: Text(_failure ? 'Failure' : 'Success'),
            )
          ],
        ),
      ),
    );
  }
}
