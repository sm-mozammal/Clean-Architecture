import 'package:clean_architecture_riverpod/features/home/data/data_sources/todo_remote_data_source.dart';
import 'package:clean_architecture_riverpod/features/home/data/models/todo_model.dart';
import 'package:clean_architecture_riverpod/features/home/data/repositories/todo_repository_impl.dart';
import 'package:clean_architecture_riverpod/features/home/domain/uses_cases/get_todos.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  List<TodoModel> _todos = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<TodoModel> get todos => _todos;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  void error(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  Future<void> fetchTodos() async {
    _isLoading = true;
    notifyListeners();

    try {
      TodoRemoteDataSource remoteDataSource = TodoRemoteDataSourceImpl();
      TodoRepositoryImpl todoRepository = TodoRepositoryImpl(
        remoteDataSource: remoteDataSource,
      );
      GetTodos getTodos = GetTodos(todoRepositoy: todoRepository);
      _todos = await getTodos.call();
    } catch (e) {
      DioException er = e as DioException;
      error(er.message.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
