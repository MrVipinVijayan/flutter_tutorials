import 'dart:async';

import 'package:flutter/material.dart';

class SearchQueryNotifier extends ValueNotifier<String> {
  SearchQueryNotifier() : super('');

  Timer? _debounceTimer;

  void setQuery(String query) {
    if (null != _debounceTimer) {
      _debounceTimer?.cancel();
    }
    _debounceTimer = Timer(const Duration(milliseconds: 300), () async {
      value = query;
    });
  }
}
