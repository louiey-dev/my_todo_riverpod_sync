import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todo_riverpod_sync/models/todo_model.dart';
import 'package:my_todo_riverpod_sync/pages/providers/todo_filter/todo_filter_provider.dart';

class FilterTodo extends ConsumerWidget {
  const FilterTodo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(todoFilterProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () {
            ref.read(todoFilterProvider.notifier).changeFilter(Filter.all);
          },
          child: Text(
            "All",
            style: TextStyle(
                fontSize: 18.0,
                color: filter == Filter.all ? Colors.blue : Colors.grey),
          ),
        ),
        TextButton(
          onPressed: () {
            ref.read(todoFilterProvider.notifier).changeFilter(Filter.active);
          },
          child: Text(
            "Active",
            style: TextStyle(
                fontSize: 18.0,
                color: filter == Filter.active ? Colors.blue : Colors.grey),
          ),
        ),
        TextButton(
          onPressed: () {
            ref
                .read(todoFilterProvider.notifier)
                .changeFilter(Filter.completed);
          },
          child: Text(
            "Completed",
            style: TextStyle(
                fontSize: 18.0,
                color: filter == Filter.completed ? Colors.blue : Colors.grey),
          ),
        ),
      ],
    );
  }
}
