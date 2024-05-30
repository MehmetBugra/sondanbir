import 'package:cosmos/cosmos.dart';
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
      '${chatMessageController.text}\n\n${userInfo["Name"]} ${userInfo["Surname"]}',
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
