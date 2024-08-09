import 'package:flutter/material.dart';
import 'package:flutter_tutorials/debouncer/debouncer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  final debouncer = Debouncer(milliseconds: 200);

  void onSearchChanged(String query) {
    debouncer.run(() {
      print('Fetching Data $query');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer - Debouncer Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
              ),
              onChanged: (value) {
                onSearchChanged(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
