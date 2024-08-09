import 'package:flutter/material.dart';
import 'package:flutter_tutorials/notifier_debouncer/search_query_notifier.dart';

class NotifierDebouncer extends StatefulWidget {
  const NotifierDebouncer({super.key});

  @override
  State<NotifierDebouncer> createState() => _NotifierDebouncerState();
}

class _NotifierDebouncerState extends State<NotifierDebouncer> {
  //
  final debouncer = SearchQueryNotifier();

  @override
  void initState() {
    super.initState();
    debouncer.addListener(() {
      print('Searching ${debouncer.value}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Value Notifier Debouncer'),
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
            const SizedBox(height: 30),
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
