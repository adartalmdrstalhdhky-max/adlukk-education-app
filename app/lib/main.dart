import 'package:flutter/material.dart';

void main() {
  runApp(const AdlukkApp());
}

class AdlukkApp extends StatelessWidget {
  const AdlukkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ADLUKK App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PlaceholderScreen(),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('ADLUKK Project Initialized. Build succeeded.',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
