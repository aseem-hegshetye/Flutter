import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TaskData extends ChangeNotifier {
  List<TaskTile> _tasksList = <TaskTile>[
    TaskTile(
      text: 'task1',
      id: 0,
    ),
    TaskTile(
      text: 'task2',
      id: 1,
    )
  ];

  UnmodifiableListView<TaskTile> get tasksList {
    return UnmodifiableListView(_tasksList);
  }

  void addTask(String newTaskTitle) {
    _tasksList.add(
      TaskTile(
        text: newTaskTitle,
        id: _tasksList.length,
      ),
    );
    notifyListeners();
  }

  void deleteTask(int index) {
    // delete that particular index
    _tasksList.removeAt(index);
    notifyListeners();
  }
}
