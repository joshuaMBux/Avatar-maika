
import 'package:flutter/material.dart';
import 'screens/chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Avatar IA Anime (Web)',
      theme: ThemeData(colorSchemeSeed: Colors.pinkAccent, useMaterial3: true),
      home: const ChatScreen(),
    );
  }
}
