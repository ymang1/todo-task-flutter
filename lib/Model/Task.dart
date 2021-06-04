import 'package:todo_task/Util/Constants.dart';

/*
Task model that contains task and its status
 - task: task string which is entered by user
 - completed: bool for task status
 */
class Task {
  String task;
  bool completed;
  String documentId;

  Task({required this.task, required this.completed, this.documentId = ''});

  Task.fromJson(Map<String, dynamic> json)
      : task = json[kFirebaseAddTaskKey],
        completed = json[kFirebaseCompletedKey],
        documentId = json[kFirebaseDocumentIdKey];

  Map<String, dynamic> toJson() {
    return {
      kFirebaseAddTaskKey: this.task,
      kFirebaseCompletedKey: this.completed,
      kFirebaseDocumentIdKey: this.documentId
    };
  }
}
