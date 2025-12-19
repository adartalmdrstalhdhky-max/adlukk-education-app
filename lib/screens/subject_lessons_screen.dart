import 'package:flutter/material.dart';

class SubjectLessonsScreen extends StatelessWidget {
final String subjectName;
SubjectLessonsScreen({required this.subjectName});

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text('دروس $subjectName')),
body: ListView.builder(
itemCount: 10,
itemBuilder: (context, index) => ListTile(
title: Text('الدرس رقم ${index + 1}'),
leading: Icon(Icons.play_lesson),
onTap: () {},
),
),
);
}
}
