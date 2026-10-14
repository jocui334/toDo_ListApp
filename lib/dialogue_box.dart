import 'package:flutter/material.dart';
import 'package:todo_app/button.dart';

class DialogueBox extends StatelessWidget {
  final myController; //template for actual createNewTask method in homepage
  VoidCallback onSave; //onSave and onCancel methods will be created in homepage
  VoidCallback onCancel;

  //these will be inputs when creating new task
  DialogueBox({
    super.key,
    required this.myController,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 150,
        width: 200,
        color: Colors.indigo[300],

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: myController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Type a new task...",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //created a button widget in a separate file to use it everywhere
              children: [
                //save button
                button(label: "Save", onPressing: onSave),

                const SizedBox(width: 10), //for gap
                //cancel button
                button(label: "Cancel", onPressing: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
