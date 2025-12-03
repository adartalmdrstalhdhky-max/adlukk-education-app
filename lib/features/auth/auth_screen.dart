import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login / Signup'),
      ),
      body: Center(
        child: Text(
          'Authentication Screen',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
