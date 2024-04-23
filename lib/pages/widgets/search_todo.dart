import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todo_riverpod_sync/pages/providers/todo_search/todo_search_provider.dart';
import 'package:my_todo_riverpod_sync/utils/debounce.dart';

class SearchTodo extends ConsumerStatefulWidget {
  const SearchTodo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchTodoState();
}

class _SearchTodoState extends ConsumerState<SearchTodo> {
  final searchController = TextEditingController();
  Debounce debounce = Debounce(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      decoration: const InputDecoration(
        labelText: "Search todos...",
        prefixIcon: Icon(Icons.search_rounded),
        border: InputBorder.none,
        filled: true,
      ),
      onChanged: (String? newSearchTerm) {
        if (newSearchTerm != null) {
          debounce.run(() {
            ref.read(todoSearchProvider.notifier).setSearchTerm(newSearchTerm);
          });
        }
      },
    );
  }
}
