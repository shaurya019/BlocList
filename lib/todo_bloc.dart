import 'package:bloc/bloc.dart';
import 'package:list/todo_event.dart';
import 'package:list/todo_state.dart';

class TodoBloc extends Bloc<ToDoEvent, TodoState> {
  final List<String> todosList = [];
  TodoBloc() : super(const TodoState()) {
    on<AddTodoEvent>(_addToEvent);
    on<RemoveTodoEvent>(_removeEvent);
  }

  void _addToEvent(AddTodoEvent event, Emitter<TodoState> emit){
    todosList.add(event.task);
    emit(state.copyWith(todos : List.from(todosList)));
  }

  void _removeEvent(RemoveTodoEvent  event, Emitter<TodoState> emit){
    todosList.remove(event.index);
    emit(state.copyWith(todos: List.from(todosList)  ));
  }
}
