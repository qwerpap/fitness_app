import 'package:fitness_app/constants/app_strings.dart';
import 'package:fitness_app/features/main_screen/view/main_screen.dart';
import 'package:fitness_app/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: theme,
      home: MainScreen(),
    );
  }
}
