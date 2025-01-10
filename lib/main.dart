import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/main_screen/main_screen.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title:"Book Buddy",
      home:MainScreen()
      );
  }
}
