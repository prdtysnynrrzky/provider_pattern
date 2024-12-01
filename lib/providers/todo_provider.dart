import 'package:flutter/material.dart';
import '../models/todo_model.dart';

class TodoProvider with ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo(String title) {
    final newTodo = Todo(
      id: DateTime.now().toString(),
      title: title,
    );
    _todos.add(newTodo);
    notifyListeners();
  }

  void toggleTodoStatus(String id) {
    final todoIndex = _todos.indexWhere((todo) => todo.id == id);
    if (todoIndex >= 0) {
      _todos[todoIndex].isCompleted = !_todos[todoIndex].isCompleted;
      notifyListeners();
    }
  }

  void deleteTodo(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}
