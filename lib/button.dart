import 'package:flutter/material.dart';

class button extends StatelessWidget {
  final String label; //button label
  VoidCallback onPressing; //action button will perform after being pressed

  button({
    super.key,
    required this.label,
    required this.onPressing,
  }); //constructor

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(label),
      onPressed: onPressing,
      color: Theme.of(context).primaryColor,
    );
  }
}
