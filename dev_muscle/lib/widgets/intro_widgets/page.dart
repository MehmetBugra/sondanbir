// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:dev_muscle/components/styles.dart';
import 'package:dev_muscle/pages/baslangic_ekrani2/GetInfoDefaultPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  String img_link;
  String text1;
  String text2;
  int index;
  IntroPage(String this.img_link, String this.text1, String this.text2,
      int this.index,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 600,
      child: Column(
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.darken),
            child: Image.asset(
              this.img_link,
              width: double.infinity,
              height: 350,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 45),
          Text(
            this.text1,
            style: TextStyles.IntroTitleText(),
          ),
          Text(
            this.text2,
            style: TextStyles.IntroSubtitleText(),
          ),
          SizedBox(height: 40),
          index == 2
              ? ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => GetInfoDefaultPage(),
                        ));
                  },
                  style: ButtonStyles.introButtonStyle(),
                  child: Text(
                    "Start Now",
                    style: TextStyles.IntroButtonText(),
                  ),
                )
              : SizedBox(width: 0, height: 0),
        ],
      ),
    );
  }
}
