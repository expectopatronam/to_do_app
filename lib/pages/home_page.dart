import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/database/database.dart';
import 'package:to_do_app/util/my_dialog.dart';
import 'package:to_do_app/util/todo_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final aboutController = TextEditingController();

  ToDoDatabase db = ToDoDatabase();

  void taskTapped(int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.upDateData();
    
  }

  saveNewTask() async {
    try {
      db.toDoList.add([aboutController.text, false]);
      aboutController.clear();
      db.upDateData();
      setState(() {});
      Navigator.pop(context);
    } catch (e) {
      print('save task error $e');
    }
  }

  void addNewTask() {
    showDialog(
        context: context,
        builder: (context) => MyDialog(
              controller: aboutController,
              onSave: saveNewTask,
              onCancel: () => Navigator.pop(context),
            ));
  }

  void deleteTask(int index) {
    db.toDoList.removeAt(index);
    db.upDateData();
    setState(() {});
  }

  void loadData() async {
    try {
      final _myBox = await Hive.box('mybox');
      if (_myBox.get('TODOLIST') == null) {
        db.firstTimeUser();
      } else {
        db.loadData();
      }
      setState(() {});
    } catch (e) {
      print('$e');
    }
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
            backgroundColor: Colors.yellow,
            title: const Text('TO DO'),
            centerTitle: true,
            elevation: 3),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow,
          onPressed: () => addNewTask(),
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) => ToDoTile(
              title: db.toDoList[index][0],
              taskFinished: db.toDoList[index][1],
              onChanged: (vakue) => taskTapped(index),
              deleteTask: (context) => deleteTask(index)),
        ));
  }
}
