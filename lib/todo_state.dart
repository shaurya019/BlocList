


import 'package:equatable/equatable.dart';

class TodoState extends Equatable {

  final List<String> todos;

  const TodoState( { this.todos = const [] });

  TodoState copyWith({ List<String>? todos  }) {
    return TodoState(
      todos: todos ?? this.todos,
    );
  }

  @override
  List<Object> get props => [ todos ];
}





