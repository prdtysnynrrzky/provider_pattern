import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/todo_model.dart';
import '../providers/todo_provider.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    return Card(
      child: ListTile(
        title: Text(
          todo.title,
          style: TextStyle(
            decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            todoProvider.deleteTodo(todo.id);
          },
        ),
        onTap: () {
          todoProvider.toggleTodoStatus(todo.id);
        },
      ),
    );
  }
}
