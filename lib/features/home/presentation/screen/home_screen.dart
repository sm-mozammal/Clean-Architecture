import 'package:clean_architecture_riverpod/features/home/presentation/provider/todo_provider.dart';
import 'package:clean_architecture_riverpod/features/home/presentation/widgets/todo_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Fetch todos when the widget is built
      Provider.of<TodoProvider>(context, listen: false).fetchTodos();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Center(
        child: Consumer<TodoProvider>(builder: (context, todos, _) {
          if (todos.isLoading) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.blue,
            ));
          }
          if (todos.errorMessage.isNotEmpty) {
            return Center(
              child: Text(
                todos.errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          return ListView.builder(
              itemCount: todos.todos.length,
              itemBuilder: (context, index) {
                var todo = todos.todos[index];
                return TodoCard(todo: todo);
              });
        }),
      ),
    );
  }
}
