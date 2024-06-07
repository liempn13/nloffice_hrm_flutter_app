import 'package:flutter/material.dart';
import 'package:hrm_app/views/widgets/bottom_nav_controller.dart';
import 'package:hrm_app/views/widgets/chip_textfield_list.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EditableChipFieldApp(),
    );
  }
}
