import 'package:flutter/material.dart';
import 'package:todo_task/Manager/ToDoManager.dart';
import 'package:todo_task/Util/Constants.dart';

class TextFieldInputWidget extends StatefulWidget {
  final TextEditingController textEditingController;
  final ToDoManager toDoManager;

  const TextFieldInputWidget(
      {required this.textEditingController, required this.toDoManager});

  @override
  _TextFieldInputWidgetState createState() => _TextFieldInputWidgetState();
}

class _TextFieldInputWidgetState extends State<TextFieldInputWidget> {
  @override
  void dispose() {
    // TODO: implement dispose
    widget.textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var style = TextStyle(
        color: Colors.white,
        fontSize: kTextFontSize,
        fontWeight: FontWeight.bold);
    return Padding(
      padding: EdgeInsets.zero,
      child: TextField(
        controller: widget.textEditingController,
        textInputAction: TextInputAction.done,
        style: style,
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            widget.toDoManager.addTaskToFirebase(value, false);
            widget.textEditingController.text = '';
          } else {
            FocusScope.of(context).unfocus();
          }
        },
        cursorHeight: kCursorHeight,
        cursorWidth: kCursorWidth,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: kInputTextHint,
          hintStyle: style,
          fillColor: Colors.red.shade800,
          filled: true,
        ),
      ),
    );
  }
}
