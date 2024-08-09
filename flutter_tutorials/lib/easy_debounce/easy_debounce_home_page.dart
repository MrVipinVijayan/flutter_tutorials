import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';

class EasyDebounceHomePage extends StatefulWidget {
  const EasyDebounceHomePage({super.key});

  @override
  State<EasyDebounceHomePage> createState() => _EasyDebounceHomePageState();
}

class _EasyDebounceHomePageState extends State<EasyDebounceHomePage> {
  //

  String query = '';

  @override
  void initState() {
    super.initState();
    EasyDebounce.debounce('my-debouncer', Duration(milliseconds: 200), () {
      print('search... $query');
    });
  }

  @override
  void dispose() {
    super.dispose();
    EasyDebounce.cancel('my-debouncer');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Easy Debounce Search'),
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
                EasyDebounce.debounce(
                    'my-debouncer', Duration(milliseconds: 200), () {
                  print('search... $query');
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
