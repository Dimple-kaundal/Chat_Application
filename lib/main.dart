import 'package:flutter/material.dart';
import 'package:flutter_application_1/Config/Theme/app_theme.dart';
import 'package:flutter_application_1/presentation/Screeen/Auth/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      
      home: LoginScreen(
        
      ));
  }
}


