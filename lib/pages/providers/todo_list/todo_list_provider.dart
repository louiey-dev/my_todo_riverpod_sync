import 'package:my_todo_riverpod_sync/models/todo_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_list_provider.g.dart';

@riverpod
class TodoList extends _$TodoList {
  @override
  List<Todo> build() {
    return [
      const Todo(id: "1", desc: "Wake up at 6am"),
      const Todo(id: "2", desc: "Have a breakfast at 7am"),
      const Todo(id: "3", desc: "Get back to work at 8am"),
    ];
  }

  void addTodo(String desc) {
    state = [...state, Todo.add(desc: desc)];
  }

  void editTodo(String id, String desc) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(desc: desc) else todo
    ];
  }

  void toggleTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(completed: !todo.completed) else todo
    ];
  }

  void removeTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id != id) todo
    ];
  }
}
