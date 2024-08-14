import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app_aug09/utils/image_constants.dart';
import 'package:quiz_app_aug09/view/quiz_screen/quiz_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
  Timer(    // timer can be used instaed of future.dalayed
    Duration(seconds: 3), (){
      Navigator.pushReplacement(
        context, 
       MaterialPageRoute(
        builder: (context)=>QuizScreen()));
    } 
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Center(child: Image.asset(ImageConstants.splashimage)),
    );
  }
}