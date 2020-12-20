import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqlite_assi/Database/database_helper.dart';
import 'package:sqlite_assi/Models/task_model.dart';

import 'package:sqlite_assi/UI_Screen/tabbar_nav.dart';

class AddNewTask extends StatefulWidget {
  _AddNewTaskState createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  DatabaseHelper helperDB = DatabaseHelper();
  String appBarName;
  Task taskk;

  TextEditingController taskNameContr = TextEditingController();
  bool isDoneValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(50),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: taskNameContr,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Your Task Name...'),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: isDoneValue,
                      onChanged: (newValue) {
                        setState(() {
                          isDoneValue = newValue;
                        });
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                RaisedButton(
                    color: Colors.blueAccent,
                    padding:
                        EdgeInsets.symmetric(horizontal: 90.0, vertical: 20.0),
                    textColor: Colors.white,
                    child: const Text(
                      'Add New Task',
                      style: TextStyle(fontSize: 17),
                    ),
                    onPressed: () {
                      setState(() {
                        saveTask(
                            taskNameContr.text, isDoneValue == true ? 1 : 0);
                      });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  void saveTask(String taskNamee, int doneVale) async {
    int result;
    result = await helperDB.insertTask(Task(taskNamee, doneVale));

    if (result == 0) {
      print("Task not saved");
      Navigator.pop(context);
    } else {
      setState(() {});
      print('Task  saved"');
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TabBarNav()),
      );
    }
  }
}
