import 'package:flutter/material.dart';
import 'package:todo_demo/model/task_model.dart';

class TaskDetailsScreen extends StatefulWidget {
  Task? task;

  TaskDetailsScreen({this.task});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.task?.title ?? ""),
            const SizedBox(height: 8.0),
            Text(widget.task?.description ?? ""),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              child: const Text('save'),
            ),
          ],
        ),
      ),
    );
  }
}
