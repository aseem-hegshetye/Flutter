import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/task_list.dart';
import 'package:todoey_flutter/bottom_sheet.dart' as bt;
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TasksScreen extends StatefulWidget {
  var taskListObj = TaskList();

  String newTask;
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    print('TaskScreen built');
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return Scaffold(
          backgroundColor: Colors.lightBlueAccent,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => bt.BuildBottomSheet2(
                  addTaskCallBack: (newTask) {
                    print('TASK SCREEN');
                    //                print('${newTask}');
                    //                widget.newTask = newTask;
                    //                setState(() {
                    //                  Provider.of<TaskData>(context).tasksList.add(
                    //                        TaskTile(
                    //                          text: '$newTask',
                    //                        ),
                    //                      );
                    //                  print(
                    //                      'no of tasks = ${Provider.of<TaskData>(context).tasksList.length}');
                    //                });
                    Navigator.pop(context);
                  },
                ), // TODO pass data
                isScrollControlled: true,
              );
            },
            backgroundColor: Colors.lightBlueAccent,
            child: Icon(
              Icons.directions_run,
            ),
          ),
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                    left: 20,
                    top: 30,
                    right: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //              SizedBox(
                      //                width: double.infinity,
                      //              ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 60,
                        child: Icon(
                          Icons.list,
                          size: 100,
                          color: Colors.lightBlueAccent,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Todoey',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${taskData.tasksList.length} Tasks',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                ExpandedListView(
                  tasksList: taskData.tasksList,
                  textIp: widget.newTask,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ExpandedListView extends StatelessWidget {
//  final List<TaskTile> tasksList;
  final List<Widget> tasksList;
  final String textIp;

  ExpandedListView({this.tasksList, this.textIp});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(
          left: 20,
          top: 30,
          right: 20,
        ),

        child: ListView.builder(
            itemCount: tasksList.length,
            itemBuilder: (BuildContext context, int index) {
              return tasksList[index];
            }),
        //                child: Text('${widget.taskListObj.tasksList.last}'),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
