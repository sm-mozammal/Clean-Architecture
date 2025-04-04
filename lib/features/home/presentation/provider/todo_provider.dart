import 'package:clean_architecture_riverpod/features/home/data/data_sources/todo_remote_data_source.dart';
import 'package:clean_architecture_riverpod/features/home/data/models/todo_model.dart';
import 'package:clean_architecture_riverpod/features/home/data/repositories/todo_repository_impl.dart';
import 'package:clean_architecture_riverpod/features/home/domain/uses_cases/get_todos.dart';
import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  List<TodoModel> _todos = [];
  bool _isLoading = false;

  List<TodoModel> get todos => _todos;
  bool get isLoading => _isLoading;

  Future<void> fetchTodos() async {
    _isLoading = true;
    notifyListeners();

    final todoRemoteDataSource = TodoRemoteDataSourceImpl();

    final todoRepository =
        TodoRepositoryImpl(remoteDataSource: todoRemoteDataSource);

    final GetTodos getTodos = GetTodos(todoRepositoy: todoRepository);

    final todos = await getTodos.call();
    _todos = todos;

    _isLoading = false;
    notifyListeners();
  }
}
