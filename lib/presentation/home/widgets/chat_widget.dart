import 'package:chat_gpt_application/models/chat_list_model.dart';
import 'package:chat_gpt_application/providers/apiservice_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatTextWidget extends StatelessWidget {
  ChatTextWidget(
      {Key? key,
      required this.message,
      required this.textColor,
      this.chatBackGroundColor,
      required this.imagePath,
      required this.circleAvatarBackgroundColor})
      : super(
          key: key,
        );

  String message;
  Color textColor;
  Color? chatBackGroundColor;
  String imagePath;
  Color circleAvatarBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(
            imagePath,
          ),
          backgroundColor: circleAvatarBackgroundColor,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: TweenAnimationBuilder<int>(
                tween: IntTween(begin: 0, end: message.length),
                duration: const Duration(seconds: 1),
                builder: (BuildContext context, int value, child) {
                  return Text(message.substring(0, value),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: (context
                                      .read<ApiserviceProviders>()
                                      .chatResponse
                                      .lastWhere((element) {
                                    return true;
                                  })).type ==
                                  ChatResponseType.api
                              ? FontWeight.bold
                              : FontWeight.normal));
                })

            //     AnimatedTextKit(
            //   animatedTexts: [
            //     TypewriterAnimatedText(message,
            //         speed: const Duration(milliseconds: 20),
            //         curve: Curves.linear,
            //         textStyle: TextStyle(
            //             color: Colors.white,
            //             fontSize: 18,
            //             fontWeight: (context
            //                         .read<ApiserviceProviders>()
            //                         .chatResponse
            //                         .lastWhere((element) {
            //                       return true;
            //                     })).type ==
            //                     ChatResponseType.api
            //                 ? FontWeight.bold
            //                 : FontWeight.normal)),

            //   ],

            //   isRepeatingAnimation: false,
            // )
            ),
      ],
    );
  }
}
