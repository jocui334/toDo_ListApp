import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class todoTile extends StatelessWidget {
  final String task;
  final bool completed;
  final Function(bool?)?
  change; //hover over onChanged in checkbox to see what method is required
  void Function(BuildContext)? delete; //slidable widget --> delete a tile

  todoTile({
    super.key,
    required this.task,
    required this.completed,
    required this.change,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: delete,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade600,
            ),
          ],
        ),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Checkbox(value: completed, onChanged: change),
                Text(
                  task,
                  style: TextStyle(
                    decoration: completed
                        ? TextDecoration.lineThrough
                        : TextDecoration.none, //if-else
                  ),
                ),
              ],
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.indigo[300],
          ),
        ),
      ),
    );
  }
}
