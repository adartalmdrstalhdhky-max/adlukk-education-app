import 'package:flutter/material.dart';
import '../../services/db_service.dart';

class TeacherListScreen extends StatelessWidget {
  final DBService dbService = DBService();

  TeacherListScreen() {
    dbService.init();
    // Sample teachers
    dbService.addTeacher({'id': '1', 'name': 'Mr. Ahmed', 'subject': 'Math'});
    dbService.addTeacher({'id': '2', 'name': 'Ms. Fatima', 'subject': 'Science'});
  }

  @override
  Widget build(BuildContext context) {
    final teachers = dbService.getAllTeachers();

    return Scaffold(
      appBar: AppBar(
        title: Text('Teachers Dashboard'),
      ),
      body: ListView.builder(
        itemCount: teachers.length,
        itemBuilder: (context, index) {
          final teacher = teachers[index];
          return ListTile(
            title: Text(teacher['name']),
            subtitle: Text('Subject: ${teacher['subject']}'),
          );
        },
      ),
    );
  }
}
