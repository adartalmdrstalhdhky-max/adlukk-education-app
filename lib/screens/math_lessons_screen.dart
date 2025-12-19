import 'package:flutter/material.dart';

class MathLessonsScreen extends StatelessWidget {
  final List<Map<String, String>> mathLessons = [
    {'title': 'العمليات الحسابية الكبرى', 'duration': '15 دقيقة'},
    {'title': 'الهندسة الفراغية الرقمية', 'duration': '20 دقيقة'},
    {'title': 'الاحصاء والاحتمالات', 'duration': '12 دقيقة'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('دروس الرياضيات - ادلك'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: mathLessons.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                child: Icon(Icons.calculate, color: Colors.white),
              ),
              title: Text(mathLessons[index]['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('المدة: ${mathLessons[index]['duration']}'),
              trailing: Icon(Icons.play_arrow_rounded, color: Colors.green),
              onTap: () {
                // الانتقال الى عرض الدرس الفردي math_lesson_screen
              },
            ),
          );
        },
      ),
    );
  }
}
