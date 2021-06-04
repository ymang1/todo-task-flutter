import 'package:flutter/material.dart';
import 'Manager/ToDoManager.dart';
import 'Widgets/DataListWidget.dart';
import 'Widgets/TextFieldInputWidget.dart';

/*
ToDoView that contains task list and related operations on task
 - TextField: TextField widget for entering the task/title
 - DataListWidget: custom data list widget that contains task list info with operations on them
 */
class ToDoListView extends StatelessWidget {
  final TextEditingController textEditingController = TextEditingController();
  final ToDoManager toDoManager = ToDoManager();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details) => _onHorizontalDrag(details, context),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
              child: Scaffold(backgroundColor: Colors.red.shade800),
            ),
            TextFieldInputWidget(textEditingController: textEditingController, toDoManager: toDoManager),
            DataListWidget(toDoManager: toDoManager),
          ],
        ),
      ),
    );
  }

  /* Navigate back to sign-up screen when user drag horizontally */
  void _onHorizontalDrag(DragEndDetails details, BuildContext context) {
    if(details.primaryVelocity == 0) return; // user have just tapped on screen (no dragging)

    if (details.primaryVelocity!.compareTo(0) != -1) {
      Navigator.pop(context);
    }
  }
}
