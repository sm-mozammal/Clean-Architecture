import 'package:clean_architecture_riverpod/features/home/data/models/todo_model.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard({
    super.key,
    required this.todo,
  });

  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.2,
      color: Colors.greenAccent[100],
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListTile(
        title: Text(todo.title),
        subtitle: Text(
          todo.completed ? 'Completed' : 'Not Completed',
          style: TextStyle(color: todo.completed ? Colors.green : Colors.red),
        ),
        trailing: Icon(
          todo.completed ? Icons.done : Icons.close,
          color: todo.completed ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
