import 'package:chat_gpt_application/constants/colors.dart';
import 'package:chat_gpt_application/presentation/home/widgets/send_icon_button.dart';
import 'package:chat_gpt_application/presentation/home/widgets/voice_record_icon_widget.dart';
import 'package:chat_gpt_application/providers/apiservice_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    Key? key,
    // required  this.questionToAiController
  }) : super(key: key);

  //final TextEditingController questionToAiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller:
                  context.read<ApiserviceProviders>().textEditingController,
              style: TextStyle(color: customewhitecolor),
              decoration: InputDecoration(
                  hintText: "Type something",
                  hintStyle: const TextStyle(color: Colors.black),
                  fillColor: Colors.blueGrey,
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.5,
                        style: BorderStyle.none,
                      ),
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
           const VoiceRecordIconWIdget(),
          const SendIconButton(),
         

        ],
      ),
    );
  }
}
