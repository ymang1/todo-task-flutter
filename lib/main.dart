import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screens/WelcomeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ToDoApp());
}

/* Main class of ToDo App */
class ToDoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// return material app object with page view
    return MaterialApp(
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
