import 'package:flutter/material.dart';
import 'package:note_app/note_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Note",
      home: NoteList(),
    );
  }
}
