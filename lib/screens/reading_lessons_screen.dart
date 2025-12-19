// reading_lessons_screen.dart
import 'package:flutter/material.dart';
class ReadingLessonsScreen extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text('دروس القراءة')),
body: ListView(children: [ListTile(title: Text('القراءة العربية'), onTap: () {})]),
);
}
}
