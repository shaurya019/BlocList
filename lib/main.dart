import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list/todo_bloc.dart';
import 'package:list/todo_event.dart';
import 'package:list/todo_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Screen(),
      ),
    );
  }
}

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if (state.todos.isEmpty) {
              return const Center(
                child: Text('No todos yet.'),
              );
            } else if (state.todos.isNotEmpty) {
              return ListView.builder(
                  itemCount: state.todos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.todos[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          BlocProvider.of<TodoBloc>(context).add(RemoveTodoEvent(state.todos[index]));
                        },
                      ),
                    );
                  });
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            for(int i = 0 ; i < 10 ; i++ ) {
              BlocProvider.of<TodoBloc>(context).add(AddTodoEvent('Task $i'));
            }
          },
          child: Icon(Icons.add),
        ));
  }
}
