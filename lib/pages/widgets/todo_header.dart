import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todo_riverpod_sync/pages/providers/active_todo_count/active_todo_count_provider.dart';
import 'package:my_todo_riverpod_sync/pages/providers/theme/theme_provider.dart';
import 'package:my_todo_riverpod_sync/pages/providers/todo_list/todo_list_provider.dart';

class TodoHeader extends ConsumerWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoCount = ref.watch(todoListProvider);
    final todoCompleted = ref.watch(activeTodoCountProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Text(
              "My TODO",
              style: TextStyle(fontSize: 36),
            ),
            const SizedBox(width: 10),
            Text(
              "$todoCompleted/${todoCount.length}",
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue[900],
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            ref.read(themeProvider.notifier).toggleTheme();
          },
          icon: const Icon(Icons.light_mode),
        ),
      ],
    );
  }
}
