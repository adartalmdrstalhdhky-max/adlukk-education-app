import 'package:flutter/material.dart';
import 'features/books/student_books_screen.dart';
import 'features/school/teacher_book_screen.dart';
import 'features/school/teacher_lesson_screen.dart';
import 'offline/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.initHive(); // تهيئة Hive قبل تشغيل التطبيق
  runApp(const AdlikApp());
}

class AdlikApp extends StatelessWidget {
  const AdlikApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adlik Education',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adlik Education'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const StudentBooksScreen()),
                );
              },
              child: const Text("واجهة الطالب - الكتب والدروس"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TeacherBookScreen()),
                );
              },
              child: const Text("واجهة المعلم - إدارة الكتب"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TeacherLessonScreen()),
                );
              },
              child: const Text("واجهة المعلم - إدارة الدروس"),
            ),
          ],
        ),
      ),
    );
  }
}
