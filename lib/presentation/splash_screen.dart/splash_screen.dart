import 'package:chat_gpt_application/providers/splash_screen_provider.dart';
import 'package:chat_gpt_application/services/asset_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SplashSCreenProvider>(
        future: context.read<SplashSCreenProvider>().navigateToHome(context),
        builder: (context, snapshot) {
          return const  Scaffold(
            body:Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(AssetManager.aiImage),
              ),
            ),
          );
        });
  }
}
