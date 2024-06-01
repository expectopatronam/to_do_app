import 'package:flutter/material.dart';
import 'package:to_do_app/util/my_button.dart';

class MyDialog extends StatelessWidget {
   MyDialog({super.key, required this.controller, required this.onSave,  required this.onCancel});

  final TextEditingController controller;
 final VoidCallback onSave;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[400],
      content: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               TextField(
                controller: controller, 
                  decoration: const  InputDecoration(border: OutlineInputBorder(), labelText: 'Add new task')),
              const SizedBox(height: 9),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButton(
                    title: 'Save',
                    onPressed: onSave,
                  ),
                  const SizedBox(width: 9),
                  MyButton(title: 'Cancel', onPressed: onCancel)
                ],
              )
            ],
          )),
    );
  }
}
