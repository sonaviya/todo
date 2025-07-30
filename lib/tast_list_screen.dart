import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_demo/provider_notifier.dart';

import 'task_details_screen.dart';
import 'model/task_model.dart';

class TaskListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskList = ref.watch(taskListProvider);
    final taskListNotifier = ref.read(taskListProvider.notifier);
    final boolComplete = ref.read(taskListProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Task List',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: taskList.length, // Example item count
        itemBuilder: (context, index) {
          var data = taskList[index];
          print(data.priority);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Slidable(
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      // Delete action logic
                      taskListNotifier.state = [
                        for (int i = 0; i < taskList.length; i++)
                          if (i != index) taskList[i],
                      ];
                    },
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaskDetailsScreen(task: data),
                    ),
                  );
                },
                onLongPress: () {
                  taskListNotifier.state = [
                    for (int i = 0; i < taskList.length; i++)
                      if (i != index) taskList[i],
                  ];
                },
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: data.priority == Priority.high
                            ? Colors.red
                            : data.priority == Priority.medium
                            ? Colors.orange
                            : Colors.green,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Completed: ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              Checkbox(
                                value: data.isCompleted ?? false,
                                onChanged: (value) {
                                  boolComplete.state = [
                                    for (final t in taskList)
                                      if (t == data)
                                        t.copyWith(isCompleted: value)
                                      else
                                        t,
                                  ];
                                },
                              ),
                            ],
                          ),
                          commonWidget("Task: ", data.title ?? 'No Title'),
                          commonWidget(
                            "Description: ",
                            data.description ?? 'No Description',
                          ),
                          commonWidget("Create Date: ", '${data.createdAt}'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  commonWidget(String title, String text) {
    return RichText(
      text: TextSpan(
        text: title,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        children: [
          TextSpan(
            text: text,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
