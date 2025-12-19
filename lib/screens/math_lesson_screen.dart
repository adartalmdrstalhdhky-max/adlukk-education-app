import 'package:flutter/material.dart';

class MathLessonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('شرح مادة الرياضيات'),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.play_circle_fill, size: 80, color: Colors.white),
                  SizedBox(height: 10),
                  Text('اضغط لتشغيل فيديو الشرح الرقمي', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('موضوع الدرس: الجبر والعمليات المنطقية', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text('هذا الدرس يقدم لطلاب منارة الاجيال الرقمية لتمكينهم من فهم اساسيات الرياضيات الحديثة.', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
