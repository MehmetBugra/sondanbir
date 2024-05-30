// ignore_for_file: must_be_immutable

import 'package:dev_muscle/components/styles.dart';
import 'package:dev_muscle/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PTInfo extends StatelessWidget {
  Map<String, dynamic> trainer;
  PTInfo({super.key, required this.trainer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              width: double.infinity,
              height: 375,
              color: Colors.pink,
              child: Image.asset(
                "assets/images/WorkoutPlans/WorkoutPlanDetails.png",
                fit: BoxFit.fill,
              )),
          Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(top: 300),
            decoration: const BoxDecoration(
              color: Color(0xff1C1C1E),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(trainer["Name"] + trainer["Surname"],
                              style: TextStyles.PTinfoNameTextStyle()),
                          const SizedBox(height: 10),
                          Text(trainer["ProfessionField"],
                              style: TextStyles.PTinfoSubtitleTextStyle()),
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: high_green,
                        child: IconButton(
                          onPressed: _launchUrl,
                          icon: const Icon(
                            Icons.chat_bubble,
                            size: 16,
                          ),
                        ),
                      )
                      // CircleAvatar(
                      //   backgroundColor: high_green,
                      //   child: Icon(Icons.chat),
                      // )
                    ],
                  ),
                  const SizedBox(height: 39),
                  Text(trainer["Description"],
                      style: TextStyles.PTinfoDescribeTextStyle()),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 56),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:
                    const Icon(Icons.turn_left_outlined, color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl() async {
    final Uri _url = Uri.parse(
        "https://wa.me/${trainer["PhoneNumber"]}?text=Merhaba,%20eğitim%20hakkında%20bilgi%20almak%20istiyorum.");

    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
