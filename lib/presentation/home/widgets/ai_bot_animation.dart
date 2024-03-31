import 'package:chat_gpt_application/services/asset_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class AibotAnimation extends StatelessWidget {
  const AibotAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        AssetManager.aibotLottie2,
        animate: true,
      ),
    );
  }
}
