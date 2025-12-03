import 'package:flutter/material.dart';

class BooksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books & Curriculum'),
      ),
      body: Center(
        child: Text(
          'Books Screen Placeholder',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
