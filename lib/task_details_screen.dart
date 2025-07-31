import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_demo/provider_notifier.dart';

class TaskDetailScreen extends ConsumerWidget {
  final String taskId;
  const TaskDetailScreen({required this.taskId, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final task = ref.watch(taskListProvider).firstWhere((t) => t.id == taskId);
    final notifier = ref.read(taskListProvider.notifier);
    final titleController = TextEditingController(text: task.title);
    final descController = TextEditingController(text: task.description);

    return Scaffold(
      appBar: AppBar(title: const Text('Task Detail')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: titleController),
            TextField(controller: descController, maxLines: 3),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                notifier.updateTask(task.copyWith(
                  title: titleController.text,
                  description: descController.text,
                ));
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
