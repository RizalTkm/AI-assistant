// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:chat_gpt_application/constants/colors.dart';

import 'package:chat_gpt_application/models/chat_list_model.dart';
import 'package:chat_gpt_application/presentation/home/widgets/ai_bot_animation.dart';
import 'package:chat_gpt_application/presentation/home/widgets/bottomsheet.dart';
import 'package:chat_gpt_application/presentation/home/widgets/chat_widget.dart';

import 'package:chat_gpt_application/presentation/home/widgets/textformfield_widget.dart';
import 'package:chat_gpt_application/providers/apiservice_provider.dart';

import 'package:chat_gpt_application/services/asset_manager.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<ApiserviceProviders>().fetchAiModels(),
      builder: (context, snapshot) {
        if(!(snapshot.hasError) ){
          if (snapshot.hasData) {
          return Scaffold(
              appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(100),
                  child: AppBar(
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(30))),
                    leadingWidth: 90,
                    toolbarHeight: 100,
                    backgroundColor: Colors.blueGrey,
                    title:  Center(child: Text("Beepo",style: GoogleFonts.oswald(letterSpacing: .5,fontSize: 30,fontWeight: FontWeight.bold),)),
                    leading: Builder(builder: (context) {
                      return const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(AssetManager.aiImage),
                        ),
                      );
                    }),
                    actions: [
                     
                      FittedBox(
                        child: IconButton(onPressed: (){
                      
                          context.read<ApiserviceProviders>().ClearingChatresponse();
                      
                        }, icon: ShaderMask(
                                  blendMode: BlendMode.srcIn,
                                  shaderCallback: (Rect bound) {
                                    return LinearGradient(colors: gradientColors).createShader(bound);
                                  },
                                  child: const Icon(Icons.refresh_rounded,size: 20,))),
                      ),
            const  FittedBox(child: bottomSheetButton()),
                    ],
                  )),
              body: Consumer<ApiserviceProviders>(
                builder: (context, apiprovider, _) {
                  return GestureDetector(
                    onTap: () {
                      final currentfocus = FocusScope.of(context);

                      if (currentfocus.hasPrimaryFocus) {
                        currentfocus.unfocus();
                      }
                    },
                    child: SafeArea(
                        child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Flexible(
                          child: apiprovider.chatResponse.isEmpty
                              ? const AibotAnimation()
                              : ListView.separated(
                                  key:
                                      const PageStorageKey<String>('home page'),
                                  clipBehavior: Clip.hardEdge,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        height: 20,
                                      ),
                                  itemCount: apiprovider.chatResponse.length,
                                  //controller: apiprovider.listScrollController,
                                  addAutomaticKeepAlives: false,
                                  itemBuilder: (context, index) {
                                    final messageListModel = apiprovider
                                        .chatResponse
                                        .toList()[index];

                                    return ChatTextWidget(
                                      message: messageListModel.responseMessage,
                                      textColor: customewhitecolor,
                                      // chatBackGroundColor:  messageListModel.type == ChatResponseType.user
                                      //     ? mainScaffoldColor
                                      //     : customgreyColor,
                                      imagePath: messageListModel.type ==
                                              ChatResponseType.user
                                          ? AssetManager.useriImage
                                          : AssetManager.aiImage,
                                      circleAvatarBackgroundColor:
                                          messageListModel.type ==
                                                  ChatResponseType.user
                                              ? mainScaffoldColor
                                              : customgreyColor,
                                    );
                                  }),
                        ),
                        // context.watch<ApiserviceProviders>().isSubmitted
                        context.watch<ApiserviceProviders>().isSubmitted == true
                            ? SpinKitDoubleBounce(
                                color: customewhitecolor,
                              )
                            : const SizedBox(),
                        const TextFormFieldWidget()
                      ],
                    )),
                  );
                },
              ));
        } else {
          //  return SizedBox();

          return const Center(
            child: SpinKitDancingSquare(color: Colors.blueGrey),
          );

          // Center(
          //     child: ShaderMask(
          //         blendMode: BlendMode.srcIn,
          //         shaderCallback: (Rect bounds) {
          //           return LinearGradient(
          //                   colors: gradientColors,
          //                   begin: Alignment.topLeft,
          //                   end: Alignment.bottomRight)
          //               .createShader(bounds);
          //         },
          //         child:const  SpinKitDancingSquare(color: Colors.blueGrey))
          //     // SpinKitDancingSquare(color: customewhitecolor),
          //     );
        }
        } else {
          return const  Icon(Icons.signal_wifi_connected_no_internet_4_rounded,color: Colors.white,);
        }
        
      },
    );
  }
}
