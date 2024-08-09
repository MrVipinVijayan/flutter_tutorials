import 'package:flutter/material.dart';
import 'package:flutter_tutorials/simple_debouncer/debouncer.dart';

class SimpleDebouncer extends StatefulWidget {
  const SimpleDebouncer({super.key});

  @override
  State<SimpleDebouncer> createState() => _SimpleDebouncerState();
}

class _SimpleDebouncerState extends State<SimpleDebouncer> {
  //
  final debouncer = Debouncer(milliseconds: 300);

  void onSearchChanged(String query) {
    debouncer.run(() {
      print('Searching $query');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Debouncer'),
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
