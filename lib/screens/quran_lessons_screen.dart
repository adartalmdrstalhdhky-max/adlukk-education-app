import 'package:flutter/material.dart';

class QuranLessonsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('دروس القران الكريم')),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Text('منارة الاجيال الرقمية - قسم القران', style: TextStyle(fontSize: 20)),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(title: Text('سورة الفاتحة'), subtitle: Text('حفظ وتجويد'), trailing: Icon(Icons.play_circle_fill)),
                  ListTile(title: Text('سورة الاخلاص'), subtitle: Text('تفسير ميسر'), trailing: Icon(Icons.play_circle_fill)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
