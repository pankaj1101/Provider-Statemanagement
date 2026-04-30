import 'package:flutter/material.dart';
import 'package:sample/model/task_model.dart';

class TaskViewModel extends ChangeNotifier {
  final List<TaskModel> _notes = [];

  // getter
  List<TaskModel> get notestList => _notes;

  // setter
  void setNotes(TaskModel task) {
    _notes.add(task);
    notifyListeners();
  }

  // final List<TaskModel> _completeNotes = [];
  // final List<TaskModel> _pendingNotes = [];

  // filter() {
  //   for (int i = 0; i < _notes.length; i++) {
  //     if (_notes[i].isCompleted) {
  //       _completeNotes.add(_notes[i]);
  //     } else {
  //       _pendingNotes.add(_notes[i]);
  //     }
  //   }
  //   notifyListeners();
  // }

  List<TaskModel> get completeNotes =>
      _notes.where((task) => task.isCompleted == true).toList();

  List<TaskModel> get pendingNotes =>
      _notes.where((task) => task.isCompleted == false).toList();

  void markIsCompleted(String id) {
    final task = _notes.firstWhere((task) => task.id == id);
    task.isCompleted = !task.isCompleted;

    notifyListeners();
  }
}


// Complete , Pending - Icon