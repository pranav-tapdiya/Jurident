import 'package:flutter/material.dart';

class tasks extends StatefulWidget {
  const tasks({super.key});

  @override
  _tasks createState() => _tasks();
}

class _tasks extends State<tasks> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("No Tasks"),

      ),
    );
  }
}