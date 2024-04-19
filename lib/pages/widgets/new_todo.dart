import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewTodo extends ConsumerStatefulWidget {
  const NewTodo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewTodoState();
}

class _NewTodoState extends ConsumerState<NewTodo> {
  final newTodoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: newTodoController,
      onSubmitted: (String? desc) {},
    );
  }
}
