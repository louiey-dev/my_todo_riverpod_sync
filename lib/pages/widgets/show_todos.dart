import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todo_riverpod_sync/pages/providers/filtered_todos/filtered_todos_provider.dart';
import 'package:my_todo_riverpod_sync/pages/providers/todo_item/todo_item_provider.dart';
import 'package:my_todo_riverpod_sync/pages/widgets/todo_item.dart';

class ShowTodos extends ConsumerWidget {
  const ShowTodos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredTodos = ref.watch(filteredTodosProvider);
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int idx) {
        return const Divider();
      },
      itemCount: filteredTodos.length,
      itemBuilder: (BuildContext context, int index) {
        // return const TodoItem();
        final todo = filteredTodos[index];
        return ProviderScope(
          overrides: [
            todoItemProvider.overrideWithValue(todo),
          ],
          child: TodoItem(),
        );
      },
    );
  }
}
