import 'package:flutter/material.dart';
import 'package:quiz_app_aug09/view/quiz_screen/quiz_screen.dart';
import 'package:quiz_app_aug09/view/splash_screen/splash_screen.dart';

void main (){
runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}