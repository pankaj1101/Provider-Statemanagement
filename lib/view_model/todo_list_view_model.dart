import 'package:flutter/widgets.dart';

class TodoListViewModel extends ChangeNotifier {
  final List<String> _tasks = [
    "Finish UI Redesign",
    "Review Pull Requests",
    "Client Strategy Meeting",
    "Update Documentation",
    "Fix Navigation Bug",
  ];

  // getter
  List<String> get getTaskList => _tasks;

  // setter
  void setTask(String task) {
    _tasks.add(task);
    notifyListeners();
  }

  final List<String> _selectedTodo = [];

  // getter
  List<String> get getSelectedTodoList => _selectedTodo;

  // setter
  void setSelectTodoTask(String task) {
    _selectedTodo.add(task);
    notifyListeners();
  }

  // to remove from the selectedList
  void removeSelectedTodo(String task) {
    _selectedTodo.remove(task);
    notifyListeners();
  }

  // Helper
  int get selectedTodosCount => _selectedTodo.length;

  bool isChecked(task) => _selectedTodo.contains(task);

  // function - isEmpty
  bool get isEmptyselectedTodosCount => _selectedTodo.isEmpty;
}
