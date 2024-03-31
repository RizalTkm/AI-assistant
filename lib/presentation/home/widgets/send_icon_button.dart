import 'package:chat_gpt_application/constants/colors.dart';
import 'package:chat_gpt_application/models/chat_list_model.dart';
import 'package:chat_gpt_application/providers/apiservice_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class SendIconButton extends StatelessWidget {
  const SendIconButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: IconButton(
          onPressed: () async {
            FocusScope.of(context).unfocus();

            final apiserviceContext = context.read<ApiserviceProviders>();
            //  context.watch<ApiserviceProviders>().setissubmitted= true;

            if (apiserviceContext.textEditingController.text.isNotEmpty) {
              apiserviceContext.chatResponse.add(ChatLIstMOdel(
                  type: ChatResponseType.user,
                  responseMessage:
                      apiserviceContext.textEditingController.text));

              await context.read<ApiserviceProviders>().fetchApiResponse(
                  apiserviceContext.getdropDownValue.toString(),
                  apiserviceContext.textEditingController.text);

              apiserviceContext.textEditingController.clear();
            } else {
              Fluttertoast.showToast(
                backgroundColor: Colors.blueGrey,
                msg: "The selected Model is }",
                textColor: Colors.white,
              );

              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("please type somthing")));
            }
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
            child: const Icon(
              Icons.send_rounded,
              size: 30,
            ),
          )),
    );
  }
}
