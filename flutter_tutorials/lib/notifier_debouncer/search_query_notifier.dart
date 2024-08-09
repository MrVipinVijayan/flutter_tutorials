import 'dart:async';
import 'package:flutter/material.dart';

class SearchQueryNotifier extends ValueNotifier<String> {
  SearchQueryNotifier() : super('');

  Timer? _timer;

  void setQuery(String query) {
    if (null != _timer) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: 300), () {
      value = query;
    });
  }
}
