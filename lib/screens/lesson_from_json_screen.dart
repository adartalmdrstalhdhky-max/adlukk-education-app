import 'package:flutter/material.dart';
import 'dart:convert';

class LessonFromJsonScreen extends StatefulWidget {
  @override
  _LessonFromJsonScreenState createState() => _LessonFromJsonScreenState();
}

class _LessonFromJsonScreenState extends State<LessonFromJsonScreen> {
  List _lessons = [];

  // دالة لجلب البيانات من ملف JSON محلي او رابط خارجي لادلك
  Future<void> readJson() async {
    // افترضنا وجود ملف دروس في المجلد assets
    String response = '{"lessons": [{"id": 1, "title": "مقدمة في التقنية"}, {"id": 2, "title": "البرمجة للاجيال"}]}';
    final data = await json.decode(response);
    setState(() {
      _lessons = data["lessons"];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('دروس منارة الاجيال')),
      body: _lessons.isEmpty 
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _lessons.length,
              itemBuilder: (ctx, index) => Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text(_lessons[index]["title"]),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
            ),
    );
  }
}

