import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo_provider.dart';
import '../widgets/todo_item.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: 'Enter a task'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) {
                      todoProvider.addTodo(_controller.text);
                      _controller.clear();
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todoProvider.todos.length,
              itemBuilder: (ctx, index) {
                final todo = todoProvider.todos[index];
                return TodoItem(todo: todo);
              },
            ),
          ),
        ],
      ),
    );
  }
}
