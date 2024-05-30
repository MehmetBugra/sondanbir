import 'package:cosmos/cosmos.dart';
import 'package:dev_muscle/pages/main/pages/personaltrainersList/ptInfo.dart';
import 'package:dev_muscle/variables/chat.dart';
import 'package:dev_muscle/variables/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> sendMessage(
  BuildContext context,
  Map<String, dynamic> userInfo,
) async {
  String tag = CosmosRandom.randomTag();
  String uid = await CosmosFirebase.getUID();
  await CosmosFirebase.add(
    reference: "chat",
    tag: tag,
    value: [
      uid,
      tag,
      '- ${TextButton(onPressed: () {
            Navigator.push(context, CupertinoPageRoute(builder: (context) {
              return PTInfo(trainer: userInfo);
            }));
          }, child: Text("aaaa"))}\n\n${chatMessageController.text}',
      CosmosTime.getNowTimeString(),
      "message",
    ],
    onError: (e) {
      CosmosAlert.showMessage(
        context,
        "Opps...",
        e.toString(),
        backgroundColor: navColor,
        color: textColor,
      );
    },
    onSuccess: () {
      sendMessageBtnVisible.value = false;
      chatMessageController.clear();
    },
  );
}
