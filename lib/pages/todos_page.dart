import 'package:flutter/material.dart';
import 'package:my_todo_riverpod_sync/pages/widgets/new_todo.dart';
import 'package:my_todo_riverpod_sync/pages/widgets/todo_header.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Text("TodoHeader"),
                TodoHeader(),
                Divider(),
                // Text("NewTodo"),
                NewTodo(),
                SizedBox(height: 20),
                Divider(),
                Text("SearchTodo"),
                SizedBox(height: 20),
                Divider(),
                Text("FilterTodo"),
                SizedBox(height: 20),
                Divider(),
                Text("ShowTodos"),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
