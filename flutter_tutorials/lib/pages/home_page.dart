import 'package:flutter/material.dart';
import 'package:flutter_tutorials/pages/custom_color_scheme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Text(
              'Hello World',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Container(
              width: 200,
              height: 200,
              color: _failure ? myColors.failure : myColors.success,
            ),
            TextButton(
              child: Text(_failure ? 'Failure' : 'Success'),
              onPressed: () {
                setState(() {
                  _failure = !_failure;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
