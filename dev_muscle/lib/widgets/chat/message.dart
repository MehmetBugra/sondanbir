import 'package:cosmos/cosmos.dart';
import 'package:dev_muscle/variables/colors.dart';
import 'package:flutter/material.dart';

Widget message(
  BuildContext context,
  bool sender,
  String name,
  String message,
  String timestamp,
  String id,
) {
  return Row(
    mainAxisAlignment:
        sender == false ? MainAxisAlignment.end : MainAxisAlignment.start,
    children: [
      CosmosMenu.builder(
        context,
        backgroundColor: cColor,
        items: [
          CosmosMenu.iconItem(
            Icons.delete,
            "Mesajı Sil",
            textColor: textColor,
          ),
        ],
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          width: width(context) * 0.6,
          decoration: BoxDecoration(
            color: navColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              CosmosLinkText(
                text: message,
                style: TextStyle(
                  color: textColor,
                  fontSize: 14,
                ),
                onTapLink: (link) async {
                  await openUrl(link);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    timestamp,
                    style: TextStyle(
                      color: textColor.withOpacity(0.7),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget image(
  BuildContext context,
  bool sender,
  String name,
  String imageUrl,
  String timestamp,
  String id,
) {
  return Row(
    mainAxisAlignment:
        sender == true ? MainAxisAlignment.end : MainAxisAlignment.start,
    children: [
      CosmosMenu.builder(
        context,
        backgroundColor: cColor,
        items: [],
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          width: width(context) * 0.6,
          decoration: BoxDecoration(
            color: navColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: textColor.withOpacity(0.7),
                  fontSize: 12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CosmosImage(
                    imageUrl,
                    width: double.infinity,
                    height: 100,
                    errorImage: const AssetImage("assets/soru.png"),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    timestamp,
                    style: TextStyle(
                      color: textColor.withOpacity(0.7),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
