
import 'package:chat_gpt_application/constants/colors.dart';
import 'package:chat_gpt_application/providers/apiservice_provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class bottomSheetButton extends StatelessWidget {
  const bottomSheetButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Future.delayed(const Duration(milliseconds: 400), () {
            showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10))),
                enableDrag: true,
                elevation: 120,
                backgroundColor: Colors.blueGrey,
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: 150,
                    child: Consumer<ApiserviceProviders>(
                      builder: (context, myType, child) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Center(
                              child: Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Text(
                                  " Models available",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Center(
                              child: DropdownButton<String>(
                                  items: myType.modelList
                                      .map<DropdownMenuItem<String>>(
                                          (e) => DropdownMenuItem(
                                                value: e.toString(),
                                                child: Text(e.toString()),
                                              ))
                                      .toList(),
                                  hint: const Text('please select'),
                                  value: myType.getdropDownValue,
                                  onChanged: (val) async {
                                    myType.setDropDownValue = val.toString();

                                    Future.delayed(
                                        const Duration(milliseconds: 400), () {
                                      Navigator.of(context).pop();
                                    });

                                    Fluttertoast.showToast(
                                      msg:
                                          "The selected Model is ${val.toString()}",
                                      textColor: Colors.white,
                                      backgroundColor: Colors.blueGrey
                                    );
                                  }),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                });
          });
        },
        icon: ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (Rect bound) {
              return LinearGradient(colors: gradientColors).createShader(bound);
            },
            child: const Icon(Icons.menu_rounded,size: 20,)));
  }
}
