import 'package:chat_gpt_application/presentation/home/home.dart';
import 'package:flutter/material.dart';

class SplashSCreenProvider extends ChangeNotifier {
  navigateToHome(context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }
}
