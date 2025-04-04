import 'package:clean_architecture_riverpod/features/home/data/models/todo_model.dart';

abstract class TodoRepositoy {
  Future<List<TodoModel>> getTodo();
}
