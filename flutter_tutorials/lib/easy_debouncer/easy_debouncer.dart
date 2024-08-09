import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';

class EasyDebouncer extends StatefulWidget {
  const EasyDebouncer({super.key});

  @override
  State<EasyDebouncer> createState() => _EasyDebouncerState();
}

class _EasyDebouncerState extends State<EasyDebouncer> {
  //
  String query = '';

  void runSearch() {
    EasyDebounce.debounce(
      'search-debouncer',
      const Duration(milliseconds: 300),
      () {
        print('Searching... $query');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Easy Debouncer'),
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
                query = value;
                runSearch();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    EasyDebounce.cancel('search-debouncer');
  }
}
