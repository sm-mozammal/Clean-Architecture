import 'package:clean_architecture_riverpod/features/home/data/models/todo_model.dart';
import 'package:clean_architecture_riverpod/features/home/domain/repositories/todo_repositoy.dart';

class GetTodos {
  final TodoRepositoy todoRepositoy;
  GetTodos({required this.todoRepositoy});

  Future<List<TodoModel>> call() async {
    return await todoRepositoy.getTodo();
  }
}
