import 'package:flutter/foundation.dart';
import 'package:my_todo_riverpod_sync/models/todo_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_filter_provider.g.dart';

@riverpod
class TodoFilter extends _$TodoFilter {
  @override
  Filter build() {
    return Filter.all;
  }

  void changeFilter(Filter newFilter) {
    state = newFilter;
    if (kDebugMode) {
      print("state : $state");
    }
  }
}
