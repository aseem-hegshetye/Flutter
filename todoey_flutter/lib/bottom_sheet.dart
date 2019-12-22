import 'package:flutter/material.dart';
import 'widgets/task_list.dart';
import 'widgets/task_tile.dart';
import 'package:todoey_flutter/widgets/task_list.dart';
import 'models/task_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'dart:collection';

class BuildBottomSheet2 extends StatelessWidget {
  String newTask = '';
  @required
  final Function addTaskCallBack;

  BuildBottomSheet2({this.addTaskCallBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450.0,
      color: Color(0xFF737373), //could change this to Color(0xFF737373),
      //so you don't have to change MaterialApp canvasColor
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(20.0),
                topRight: const Radius.circular(20.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              textAlign: TextAlign.center,
              autofocus: true,
              onChanged: (value) {
                print(value);
                newTask = value;
              },
              //            decoration: InputDecoration(
              //              labelStyle: TextStyle(),
              //              hintText: 'New task',
              //            ),
            ),
            FlatButton(
              color: Colors.lightBlueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              onPressed: () {
//                print('Add this to task list ${newTask}');

//                this.taskListObj.tasksList.add(
//                      TaskTile(
//                        text: newTask,
//                      ),
//                    );
//                print('no of tasks = ${this.taskListObj.tasksList.length}');
//                this.addTaskCallBack(newTask);
//                Provider.of<TaskData>(context).tasksList.add(
//                      TaskTile(
//                        text: '$newTask',
//                      ),
//                    );
                Provider.of<TaskData>(context).addTask(newTask);
                Navigator.pop(context);
              },
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Widget buildBottomSheet(BuildContext context) {
//  String newTask = '';
//  return Container(
//    height: 450.0,
//    color: Color(0xFF737373), //could change this to Color(0xFF737373),
//    //so you don't have to change MaterialApp canvasColor
//    child: Container(
//      padding: EdgeInsets.all(20),
//      decoration: BoxDecoration(
//          color: Colors.white,
//          borderRadius: BorderRadius.only(
//              topLeft: const Radius.circular(20.0),
//              topRight: const Radius.circular(20.0))),
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.stretch,
//        mainAxisAlignment: MainAxisAlignment.start,
//        children: <Widget>[
//          Text(
//            "Add Task",
//            textAlign: TextAlign.center,
//            style: TextStyle(
//              fontSize: 30,
//              color: Colors.lightBlueAccent,
//            ),
//          ),
//          TextField(
//            textAlign: TextAlign.center,
//            autofocus: true,
//            onChanged: (value) {
//              print(value);
//              newTask = value;
//            },
////            decoration: InputDecoration(
////              labelStyle: TextStyle(),
////              hintText: 'New task',
////            ),
//          ),
//          FlatButton(
//            color: Colors.lightBlueAccent,
//            shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.circular(18.0),
//            ),
//            onPressed: () {
//              print('Add this to task list');
////              context.
////              this.taskListObj.tasksList.add(
////                    TaskTile(
////                      text: newTask,
////                    ),
////                  );
//            },
//            child: Text(
//              'Add',
//              style: TextStyle(
//                color: Colors.white,
//              ),
//            ),
//          ),
//        ],
//      ),
//    ),
//  );
//}
