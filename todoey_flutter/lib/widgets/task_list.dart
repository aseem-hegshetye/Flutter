import 'package:flutter/material.dart';
import 'task_tile.dart';

class TaskList extends StatefulWidget {
  List<Widget> tasksList = <Widget>[
    TaskTile(
      text: 'task10',
    )
  ];
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
//    tasksList.add(TaskTile(text: 'task1'));
    return ListView(
      children: widget.tasksList,
//      <Widget>[

//        TaskTile(
//          text: 'task1',
//        ),
//        TaskTile(
//          text: 'task2',
//        ),
//        TaskTile(
//          text: 'task3',
//        ),
//      ],
    );
  }
}
