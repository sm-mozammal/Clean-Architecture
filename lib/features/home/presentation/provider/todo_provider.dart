import 'package:clean_architecture_riverpod/features/home/data/models/todo_model.dart';
import 'package:clean_architecture_riverpod/features/home/domain/uses_cases/get_todos.dart';
import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  final GetTodos getTodos;

  TodoProvider({required this.getTodos});

  List<TodoModel> _todos = [];
  bool _isLoading = false;

  List<TodoModel> get todos => _todos;
  bool get isLoading => _isLoading;

  Future<void> fetchTodos() async {
    _isLoading = true;
    notifyListeners();

    final todos = await getTodos.call();
    _todos = todos;

    _isLoading = false;
    notifyListeners();
  }
}
