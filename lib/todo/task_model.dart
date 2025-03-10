import 'package:uuid/uuid.dart';

class Task {
  final String id;
  final String title;
  final DateTime dateTime;
  bool isCompleted;
  int index;

  Task({
    String? id,
    required this.title,
    DateTime? dateTime,
    this.isCompleted = false,
    required this.index,
  })  : id = id ?? const Uuid().v4(),
        dateTime = dateTime ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "isCompleted": isCompleted,
      "dateTime": dateTime.toIso8601String(),
      "index": index,
    };
  }

  static Task fromMap(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      isCompleted: json['isCompleted'],
      dateTime: DateTime.parse(json['dateTime']),
      index: json['index'],
    );
  }
}

Task task = Task(
    title: 'Drink 8 glasses of water',
    index: 0,
    dateTime: DateTime.now(),
    id: Uuid().v4(),
    isCompleted: true);
