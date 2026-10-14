import 'package:flutter/material.dart';
import 'package:todo_app/dialogue_box.dart';
import 'package:todo_app/todoTile.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  final _controller = TextEditingController();

  //the listview builder will traverse this list
  //when save button is pressed new task will be added to this list
  List<dynamic> todoList = [
    ["Eat", false],
    ["Workout", false],
    ["Water the plants", false],
  ];

  //method to check/uncheck the checkbox when pressed (onChanged)

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  //method to show dialogue box when add button is pressed to create a new task

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogueBox(
          myController: _controller,
          onSave: onSave,
          onCancel: () => Navigator.of(context).pop(), //closes the dialogue box
        );
      },
    );
  }

  //method to add a new task to list when 'save' button is pressed
  void onSave() {
    setState(() {
      todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop(); //closes dialogue box
  }

  //method to remove task from list when delete is pressed
  void deleteTask(index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("To Do"),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: createNewTask,
      ),

      //not simply listview as it wont be dynamic
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return todoTile(
            task: todoList[index][0],
            completed: todoList[index][1],
            change: (value) => checkBoxChanged(value, index),
            delete: (value) => deleteTask(index),
          );
        },
      ),
    );
  }
}
