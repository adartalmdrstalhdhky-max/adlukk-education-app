import 'package:flutter/material.dart';

// Screens
import 'features/school/student_screen.dart';
import 'features/school/teacher_list_screen.dart';
import 'features/books/books_list_screen.dart';

// AI Assistants
import 'features/ai/ai_student_assistant.dart';
import 'features/ai/ai_teacher_assistant.dart';

void main() {
  runApp(AdlikApp());
}

class AdlikApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adlik Education',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  final AIStudentAssistant studentAI = AIStudentAssistant();
  final AITeacherAssistant teacherAI = AITeacherAssistant();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adlik Education Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Student Dashboard'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentScreen()),
                );
              },
            ),
            ElevatedButton(
              child: Text('Teacher Dashboard'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TeacherListScreen()),
                );
              },
            ),
            ElevatedButton(
              child: Text('Books & Curriculum'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BooksListScreen()),
                );
              },
            ),
            SizedBox(height: 30),
            ElevatedButton(
              child: Text('Ask AI (Student)'),
              onPressed: () {
                String response = studentAI.askQuestion("What is 2+2?");
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("AI Response"),
                    content: Text(response),
                    actions: [
                      TextButton(
                        child: Text("OK"),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text('Ask AI (Teacher)'),
              onPressed: () {
                String response = teacherAI.askQuestion("Explain photosynthesis");
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("AI Response"),
                    content: Text(response),
                    actions: [
                      TextButton(
                        child: Text("OK"),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
