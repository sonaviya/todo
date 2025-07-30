class Task {
  String? id;
  String? title;
  String? description;
  bool? isCompleted;
  Priority? priority; // enum: High, Medium, Low
  String? category;
  DateTime? createdAt;
  DateTime? dueDate;

  Task({this.id, this.title, this.description, this.isCompleted, this.priority,
      this.category, this.createdAt, this.dueDate});

  Task copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
    Priority? priority,
    String? category,
    DateTime? createdAt,
    DateTime? dueDate,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      priority: priority ?? this.priority,
      category: category ?? this.category,
      createdAt: createdAt ?? this.createdAt,
      dueDate: dueDate ?? this.dueDate,
    );
  }
}

enum Priority { high, medium, low }

