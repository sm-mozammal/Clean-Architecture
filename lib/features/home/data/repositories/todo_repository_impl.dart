import 'dart:developer';

import 'package:clean_architecture_riverpod/core/services/networks/dio/dio.dart';
import 'package:clean_architecture_riverpod/features/home/data/data_sources/todo_remote_data_source.dart';
import 'package:clean_architecture_riverpod/features/home/data/models/todo_model.dart';
import 'package:clean_architecture_riverpod/features/home/domain/repositories/todo_repositoy.dart';

class TodoRepositoryImpl implements TodoRepositoy {
  final TodoRemoteDataSource remoteDataSource;
  TodoRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<TodoModel>> getTodo() {
    return remoteDataSource.getTodo().then((value) {
      return value;
    }).catchError((error) {
      log(error.toString());
      throw Exception('Failed to fetch todos: $error');
    });
  }
}
