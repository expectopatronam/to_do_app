import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  const ToDoTile({super.key , required this.title, required this.taskFinished, required this.onChanged, required this.deleteTask});

  final String title;
  final bool taskFinished;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteTask;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
        SlidableAction(onPressed: deleteTask, backgroundColor: Colors.red,
        borderRadius: BorderRadius.circular(10),
        icon: Icons.delete_forever_sharp
        )
      ]),
        child: Container(
          padding: const EdgeInsets.all(15),
      
            decoration:  BoxDecoration(color: Colors.yellow, borderRadius: BorderRadius.circular(15)),
            child:   Row(children: [
              Checkbox(
                value: taskFinished , onChanged: onChanged , 
      
              ),
              Text(title, style: TextStyle(decoration:taskFinished ? TextDecoration.lineThrough : TextDecoration.none))])),
      ),
    );
  }
}
