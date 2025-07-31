import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_demo/provider_notifier.dart';
import 'package:todo_demo/task_details_screen.dart';

import 'add_task_screen.dart';
import 'model/task_model.dart';

class TaskListScreen extends ConsumerWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    final tasks = ref.watch(taskListProvider);
    final completedCount = tasks.where((t) => t.isCompleted).length;

    return Scaffold(
      appBar: AppBar(
        title: Text('$completedCount of ${tasks.length} completed'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (_, index) {
          final task = tasks[index];
          final isOverdue = task.dueDate.isBefore(DateTime.now());

          return Dismissible(
            key: Key(task.id),
            onDismissed: (_) => ref.read(taskListProvider.notifier).deleteTask(task.id),
            child: Card(
              color: isOverdue ? Colors.red.shade50 : null,
              child: ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (_) => TaskDetailScreen(taskId: task.id),
                  ));
                },
                title: Text(
                  task.title,
                  style: task.isCompleted
                      ? TextStyle(decoration: TextDecoration.lineThrough)
                      : null,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(task.description.length > 50
                        ? task.description.substring(0, 50) + '...'
                        : task.description),
                    Wrap(
                      spacing: 4,
                      children: [
                        Chip(label: Text(task.category)),
                        Chip(
                          label: Text(task.priority.name.toUpperCase()),
                          backgroundColor: _priorityColor(task.priority),
                        ),
                      ],
                    ),
                    Text('Created: ${task.createdAt.toLocal()}'),
                  ],
                ),
                trailing: Checkbox(
                  value: task.isCompleted,
                  onChanged: (_) =>
                      ref.read(taskListProvider.notifier).toggleComplete(task.id),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AddTaskScreen()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }

  Color _priorityColor(Priority p) {
    switch (p) {
      case Priority.high:
        return Colors.red;
      case Priority.medium:
        return Colors.orange;
      case Priority.low:
        return Colors.green;
    }
  }
}
