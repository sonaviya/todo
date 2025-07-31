import 'package:riverpod/riverpod.dart';

import 'model/task_model.dart';

final taskListProvider = StateNotifierProvider<TaskListNotifier, List<Task>>((
  ref,
) {
  return TaskListNotifier();
});

class TaskListNotifier extends StateNotifier<List<Task>> {
  TaskListNotifier() : super(_initialTasks());

  void addTask(Task task) => state = [...state, task];

  void deleteTask(String id) => state = state.where((t) => t.id != id).toList();

  void toggleComplete(String id) {
    state = state
        .map((t) => t.id == id ? t.copyWith(isCompleted: !t.isCompleted) : t)
        .toList();
  }

  void updateTask(Task updated) {
    state = state.map((t) => t.id == updated.id ? updated : t).toList();
  }

  static List<Task> _initialTasks() {
    return [
      Task(
        id: '1',
        title: 'Design user interface mockups',
        description:
            'Create wireframes and high-fidelity designs for the mobile app',
        isCompleted: false,
        priority: Priority.high,
        category: 'Design',
        createdAt: DateTime.now().subtract(Duration(days: 2)),
        dueDate: DateTime.now().add(Duration(days: 1)),
      ),
      Task(
        id: '2',
        title: 'Code review for authentication module',
        description: 'Review pull request #124 for the new login system',
        isCompleted: true,
        priority: Priority.medium,
        category: 'Development',
        createdAt: DateTime.now().subtract(Duration(days: 3)),
        dueDate: DateTime.now().subtract(Duration(days: 1)),
      ),
      Task(
        id: '3',
        title: 'Update project documentation',
        description: 'Add API endpoints documentation and update README',
        isCompleted: false,
        priority: Priority.low,
        category: 'Documentation',
        createdAt: DateTime.now().subtract(Duration(days: 1)),
        dueDate: DateTime.now().add(Duration(days: 5)),
      ),
      Task(
        id: '4',
        title: 'Fix payment gateway integration bug',
        description: 'Resolve issue with credit card processing timeout',
        isCompleted: false,
        priority: Priority.high,
        category: 'Bug Fix',
        createdAt: DateTime.now().subtract(Duration(days: 4)),
        dueDate: DateTime.now(),
      ),
      Task(
        id: '5',
        title: 'Prepare quarterly presentation',
        description: 'Create slides for Q1 business review meeting',
        isCompleted: true,
        priority: Priority.medium,
        category: 'Business',
        createdAt: DateTime.now().subtract(Duration(days: 7)),
        dueDate: DateTime.now().subtract(Duration(days: 2)),
      ),
      Task(
        id: '6',
        title: 'Optimize database queries',
        description: 'Improve performance of user dashboard loading',
        isCompleted: false,
        priority: Priority.medium,
        category: 'Performance',
        createdAt: DateTime.now().subtract(Duration(days: 1)),
        dueDate: DateTime.now().add(Duration(days: 3)),
      ),
      Task(
        id: '7',
        title: 'Team meeting - Sprint planning',
        description: 'Plan tasks and estimate story points for next sprint',
        isCompleted: true,
        priority: Priority.low,
        category: 'Meeting',
        createdAt: DateTime.now().subtract(Duration(days: 5)),
        dueDate: DateTime.now().subtract(Duration(days: 3)),
      ),
      Task(
        id: '8',
        title: 'Write unit tests for user service',
        description: 'Add comprehensive test coverage for UserService class',
        isCompleted: false,
        priority: Priority.medium,
        category: 'Testing',
        createdAt: DateTime.now().subtract(Duration(hours: 6)),
        dueDate: DateTime.now().add(Duration(days: 2)),
      ),
      Task(
        id: '9',
        title: 'Update mobile app store listing',
        description:
            'Refresh screenshots and app description for both iOS and Android',
        isCompleted: false,
        priority: Priority.low,
        category: 'Marketing',
        createdAt: DateTime.now().subtract(Duration(days: 2)),
        dueDate: DateTime.now().add(Duration(days: 7)),
      ),
      Task(
        id: '10',
        title: 'Security audit review',
        description:
            'Review third-party security audit findings and create action plan',
        isCompleted: false,
        priority: Priority.high,
        category: 'Security',
        createdAt: DateTime.now().subtract(Duration(days: 1)),
        dueDate: DateTime.now().add(Duration(hours: 8)),
      ),
      Task(
        id: '11',
        title: 'Backup server maintenance',
        description: 'Perform routine maintenance and verify backup integrity',
        isCompleted: true,
        priority: Priority.medium,
        category: 'DevOps',
        createdAt: DateTime.now().subtract(Duration(days: 6)),
        dueDate: DateTime.now().subtract(Duration(days: 4)),
      ),
      Task(
        id: '12',
        title: 'Client feedback analysis',
        description:
            'Analyze customer feedback from last month and identify improvement areas',
        isCompleted: false,
        priority: Priority.low,
        category: 'Research',
        createdAt: DateTime.now().subtract(Duration(hours: 12)),
        dueDate: DateTime.now().add(Duration(days: 4)),
      ),
      Task(
        id: '13',
        title: 'Implement dark mode feature',
        description: 'Add dark theme support across all app screens',
        isCompleted: false,
        priority: Priority.medium,
        category: 'Feature',
        createdAt: DateTime.now().subtract(Duration(days: 3)),
        dueDate: DateTime.now().add(Duration(days: 6)),
      ),
      Task(
        id: '14',
        title: 'Setup CI/CD pipeline',
        description: 'Configure automated testing and deployment pipeline',
        isCompleted: true,
        priority: Priority.high,
        category: 'DevOps',
        createdAt: DateTime.now().subtract(Duration(days: 8)),
        dueDate: DateTime.now().subtract(Duration(days: 5)),
      ),
      Task(
        id: '15',
        title: 'User onboarding flow redesign',
        description: 'Improve new user experience and reduce drop-off rates',
        isCompleted: false,
        priority: Priority.high,
        category: 'UX',
        createdAt: DateTime.now().subtract(Duration(hours: 18)),
        dueDate: DateTime.now().add(Duration(days: 8)),
      ),
    ];
  }

  final taskListProvider = StateProvider<List<Task>>((ref) {
    return [];
  });
}
