import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TaskTile extends StatefulWidget {
  TaskTile({this.text, this.id});
  final String text;
  final int id;
  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 0),
      onLongPress: () {
        print('longpress id=${widget.id}');
        Provider.of<TaskData>(context).deleteTask(widget.id);
      },
      title: Text(
        widget.text,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
          value: isChecked,
          onChanged: (newValue) {
            print(newValue);
            setState(() {
              isChecked = !isChecked;
            });
          }),
    );
  }
}

//class TaskTile extends StatelessWidget {
//  TaskTile({this.text});
//  String text;
//  @override
//  Widget build(BuildContext context) {
//    return ListTile(
//      contentPadding: EdgeInsets.only(left: 0),
//      title: Text(this.text),
//      trailing: Checkbox(
//          value: true,
//          onChanged: (value) {
//            print(value);
//          }),
//    );
//  }
//}
