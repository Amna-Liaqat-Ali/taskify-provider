import 'package:flutter/material.dart';

import '../models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  //Add Tasks
  void addTask(String title) {
    if (title.isEmpty) return;
    _tasks.add(Task(title: title));
    notifyListeners();
  }

  //Delete Tasks
  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void toggleTask(int index) {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    notifyListeners();
  }
}
