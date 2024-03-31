import 'package:chat_gpt_application/constants/colors.dart';
import 'package:chat_gpt_application/providers/speach_to_text_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VoiceRecordIconWIdget extends StatelessWidget {
  const VoiceRecordIconWIdget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.read<SpeechToTextProvider>().speachToTextconverter();
        },
        icon: ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                      colors: gradientColors,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)
                  .createShader(bounds);
            },
            child: const  Icon(
              Icons.mic,
              size: 30,
            )));
  }
}
