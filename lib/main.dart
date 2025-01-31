import 'package:flutter/material.dart';
import 'Audio.dart'; // Correct the filename

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Media Storage App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MediaStorage(), // Ensure this matches the class name in Audio.dart
    );
  }
}