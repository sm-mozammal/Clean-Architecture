import 'dart:developer';

import 'package:clean_architecture_riverpod/core/errors/exception_handler/data_source.dart';
import 'package:clean_architecture_riverpod/core/services/networks/dio/dio.dart';
import 'package:clean_architecture_riverpod/features/home/data/models/todo_model.dart';
import 'package:dio/dio.dart';

abstract class TodoRemoteDataSource {
  Future<List<TodoModel>> getTodo();
}

class TodoRemoteDataSourceImpl implements TodoRemoteDataSource {
  @override
  Future<List<TodoModel>> getTodo() async {
    try {
      Response response =
          await getHttp('https://jsonplaceholder.typicode.com/todos');

      if (response.statusCode == 200) {
        return (response.data as List)
            .map((json) => TodoModel.fromJson(json))
            .toList();
      } else {
        throw DataSource.DEFAULT.getFailure();
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
