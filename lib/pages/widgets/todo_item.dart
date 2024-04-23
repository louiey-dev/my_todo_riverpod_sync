import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_todo_riverpod_sync/pages/providers/todo_item/todo_item_provider.dart';
import 'package:my_todo_riverpod_sync/pages/providers/todo_list/todo_list_provider.dart';
import 'package:my_todo_riverpod_sync/models/todo_model.dart';

class TodoItem extends ConsumerWidget {
  TodoItem({super.key});
  final editController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todo = ref.watch(todoItemProvider);
    print('building TodoItem');

    return ListTile(
      title: Text(todo.desc),
      leading: Checkbox(
        value: todo.completed,
        onChanged: (bool? checked) {
          ref.watch(todoListProvider.notifier).toggleTodo(todo.id);
          print(todo.completed);
        },
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Are you sure?"),
                  content: const Text("Do you really want to delete?"),
                  actions: [
                    OutlinedButton(
                        onPressed: () {
                          ref
                              .read(todoListProvider.notifier)
                              .removeTodo(todo.id);
                          Navigator.pop(context);
                          print("Press YES");
                        },
                        child: const Text("Yes")),
                    OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          print("Press No");
                        },
                        child: const Text("No")),
                  ],
                );
              });
        },
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Edit Todo"),
              content: TextField(
                controller: editController,
                decoration: InputDecoration(
                  label: Text(todo.desc),
                ),
                onSubmitted: (value) {
                  ref
                      .read(todoListProvider.notifier)
                      .editTodo(todo.id, editController.text);
                  Navigator.pop(context);
                },
              ),
              actions: [
                OutlinedButton(
                    onPressed: () {
                      ref
                          .read(todoListProvider.notifier)
                          .editTodo(todo.id, editController.text);
                      Navigator.pop(context);
                    },
                    child: const Text("Edit")),
                OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel")),
              ],
            );
          },
        );
      },
    );
    // return InkWell(
    //   onTap: () {
    //     showDialog(
    //       context: context,
    //       builder: (BuildContext context) {
    //         return const AlertDialog(
    //           title: Text("Edit Todo"),
    //           content: TextField(
    //             controller: editController,
    //             onSubmitted: (String? editStr) {},
    //           ),
    //         );
    //       },
    //     );
    //   },
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       Checkbox(
    //         // value: filteredTodos[idx].completed,
    //         value: !filteredTodos[idx].completed,
    //         onChanged: (bool? checked) {
    //           ref
    //               .read(todoListProvider.notifier)
    //               .toggleTodo(filteredTodos[idx].id);
    //           if (kDebugMode) {
    //             print("check ${filteredTodos[idx].completed}");
    //           }
    //         },
    //       ),
    //       Text(filteredTodos[idx].desc, textAlign: TextAlign.start),
    //       IconButton(
    //         icon: const Icon(Icons.delete),
    //         onPressed: () {
    //           if (kDebugMode) {
    //             print("removed");
    //           }
    //           return;
    //         },
    //       ),
    //     ],
    //   ),
    // );
  }
}
