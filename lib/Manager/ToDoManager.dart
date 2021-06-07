import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_task/Model/Task.dart';
import 'package:todo_task/Util/Constants.dart';

/* ToDoManager class for performing firebase operations (like add, fetch, delete) */
class ToDoManager {
  /* Add task to firebase */
  Future<void> addTaskToFirebase(String task, bool completed) async {
    final Task taskObject = Task(task: task, completed: completed);
    FirebaseFirestore.instance
        .collection(kFirebaseCollectionDataKey)
        .doc()
        .set(taskObject.toJson());
  }

  /* Fetch all tasks from Firebase */
  Stream<QuerySnapshot<Map<String, dynamic>>> fetchAllTaskFromFirebase() {
    return FirebaseFirestore.instance
        .collection(kFirebaseCollectionDataKey)
        .snapshots();
  }

  /* Update task in Firebase */
  void updateTaskInFirebase(
      String documentID, String task, bool completed) async {
    Task taskObject =
        Task(task: task, completed: completed, documentId: documentID);
    await FirebaseFirestore.instance
        .collection(kFirebaseCollectionDataKey)
        .doc(documentID)
        .update(taskObject.toJson())
        .whenComplete(() => print('successfully updated task in firebase'))
        .catchError((error) => print(error));
  }

  /* Delete task from Firebase */
  void deleteTaskFromFirebase(String documentID) async {
    await FirebaseFirestore.instance
        .collection(kFirebaseCollectionDataKey)
        .doc(documentID)
        .delete()
        .whenComplete(() => print('delete success'))
        .catchError((error) => print(error));
  }

  /* Get stored task items list */
  List<Task> getStoredItems(AsyncSnapshot<QuerySnapshot> snapshot) {
    var docList = snapshot.data!.docs.map((e) => e).toList();
    var json = jsonEncode(
        snapshot.data!.docs.map((document) => document.data()).toList());
    List<dynamic> decodedJson = jsonDecode(json);
    List<Task> taskLists =
        List<Task>.from(decodedJson.map((task) => Task.fromJson(task)));

    // updating task list locally with document id
    for (var index = 0; index < docList.length; index++) {
      Task task = taskLists[index];
      if (task.documentId.isEmpty) {
        task.documentId = docList[index].id;
        taskLists[index] = task;
      } else {
        continue;
      }
    }

    // sorting complete/incomplete task in List
    List<Task> completedTaskList = <Task>[];
    List<Task> incompleteTaskList = <Task>[];

    incompleteTaskList =
        taskLists.where((element) => !element.completed).toList();
    completedTaskList =
        taskLists.where((element) => element.completed).toList();

    incompleteTaskList.addAll(completedTaskList);
    taskLists.clear();
    taskLists = incompleteTaskList;
    return taskLists;
  }
}
