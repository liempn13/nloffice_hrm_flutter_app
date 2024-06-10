import 'package:flutter/material.dart';
import 'package:hrm_app/views/screen/Token.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: MyDismissibleList(),
        ),
      ),
    );
  }
}
