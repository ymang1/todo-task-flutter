import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_task/Manager/ToDoManager.dart';
import 'package:todo_task/Model/Task.dart';
import 'package:todo_task/Util/Constants.dart';
import 'ListTileWidget.dart';
import 'SwipeWidget.dart';

/*
Custom Data List widget that contains task list info with operations (like reordering, left swipe for delete item and right swipe for task completion status) on them
 - toDoManager: Instance of ToDoManager
 */
class DataListWidget extends StatelessWidget {
  final ToDoManager toDoManager;
  DataListWidget({required this.toDoManager});

  final List<Color> colorShades = <Color>[
    Colors.red.shade800,
    Colors.red.shade700,
    Colors.red.shade600,
    Colors.orange.shade900,
    Colors.orange.shade800,
    Colors.orange.shade700,
    Colors.amber.shade700,
    Colors.amber.shade600,
    Colors.amber.shade500,
    Colors.amber.shade400
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        stream: toDoManager.fetchAllTaskFromFirebase(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Task> items = toDoManager.getStoredItems(snapshot);
          return ReorderableListView.builder(
              itemCount: items.length,
              onReorder: (int oldIndex, int newIndex) {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final Task item = items.removeAt(oldIndex);
                items.insert(newIndex, item);
              },
              itemBuilder: (context, index) {
                return getDismissibleWidget(items, index);
              });
        },
      ),
    );
  }

  Dismissible getDismissibleWidget(List<Task> items, int index) {
    return Dismissible(
      direction: items[index].completed
          ? DismissDirection.endToStart
          : DismissDirection.horizontal,
      background: SwipeWidget(
        icon: Icons.check,
        padding: EdgeInsets.only(left: 15),
        alignment: AlignmentDirectional.centerStart,
        backgroundColor: Colors.green,
      ),
      secondaryBackground: SwipeWidget(
          icon: Icons.close,
          iconColor: Colors.red,
          padding: EdgeInsets.only(right: 15),
          alignment: AlignmentDirectional.centerEnd),
      key: Key(items[index].task),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd &&
            items[index].completed == false) {
          toDoManager.updateTaskInFirebase(
              items[index].documentId, items[index].task, true);
        } else if (direction == DismissDirection.endToStart) {
          toDoManager
              .deleteTaskFromFirebase(items[index].documentId);
        }
      },
      child: ListTileWidget(
        title: items[index].task,
        cellHeight: kListCellHeight,
        cellBGColor: colorShades[index % colorShades.length],
        isCompleted: items[index].completed,
      ),
    );
  }
}
