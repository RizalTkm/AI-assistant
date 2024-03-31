import 'package:chat_gpt_application/constants/colors.dart';
import 'package:chat_gpt_application/presentation/splash_screen.dart/splash_screen.dart';
import 'package:chat_gpt_application/providers/apiservice_provider.dart';
import 'package:chat_gpt_application/providers/speach_to_text_provider.dart';
import 'package:chat_gpt_application/providers/splash_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {

  await dotenv.load(fileName: '.env');
 
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ApiserviceProviders>(
          create: (context) => ApiserviceProviders(),
        ),
        ChangeNotifierProvider<SplashSCreenProvider>(
          create: (context) => SplashSCreenProvider(),
        ),
        ChangeNotifierProvider<SpeechToTextProvider>(
          create: (context) => SpeechToTextProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: blackScaffoldColor,
          // textTheme: defaultTextTheme,
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
          })),
      debugShowCheckedModeBanner: false,
      title: "Chat Gpt App",
      home: const SplashScreen(),
    );
  }
}
