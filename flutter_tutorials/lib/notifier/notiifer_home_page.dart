import 'package:flutter/material.dart';
import 'package:flutter_tutorials/notifier/search_query_notifier.dart';

class NotifierHomePage extends StatefulWidget {
  const NotifierHomePage({super.key});

  @override
  State<NotifierHomePage> createState() => _NotifierHomePageState();
}

class _NotifierHomePageState extends State<NotifierHomePage> {
  //
  final debouncer = SearchQueryNotifier();

  @override
  void initState() {
    super.initState();
    debouncer.addListener(
      () {
        print('changed ${debouncer.value}');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Value Notifier Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: debouncer,
              builder: (context, value, child) => Text(
                'Searching ${debouncer.value}',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
              ),
              onChanged: (value) {
                debouncer.setQuery(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
