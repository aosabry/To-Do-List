class TaskModel {
  int? id;
  String title;
  String? notes;
  String? priority;
  String? date;
  bool? isDone;

  TaskModel({
    this.id,
    required this.title,
    required this.notes,
    required this.priority,
    required this.date,
    this.isDone,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'notes': notes,
      'priority': priority,
      'date': date,
      'isDone': isDone,
    };
  }

  static TaskModel fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      title: map['title'],
      notes: map['notes'],
      priority: map['priority'],
      date: map['date'],
      isDone: map['isDone'] == 1,
    );
  }
}
