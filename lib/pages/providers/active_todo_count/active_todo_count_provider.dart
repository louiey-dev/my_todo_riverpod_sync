import 'package:my_todo_riverpod_sync/pages/providers/todo_list/todo_list_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'active_todo_count_provider.g.dart';

@riverpod
int activeTodoCount(ActiveTodoCountRef ref) {
  final todos = ref.watch(todoListProvider);

  return todos.where((element) => !element.completed).length;
}
