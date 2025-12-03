import 'package:flutter/material.dart';

class StudentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Dashboard'),
      ),
      body: Center(
        child: Text(
          'Student Panel',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
