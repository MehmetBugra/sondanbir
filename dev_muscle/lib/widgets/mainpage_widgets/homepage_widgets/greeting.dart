// ignore_for_file: must_be_immutable

import 'package:dev_muscle/components/styles.dart';
import 'package:flutter/material.dart';

class GreetingText extends StatelessWidget {
  String name;
  GreetingText({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "HELLO ${name.toUpperCase()},",
          style: TextStyles.GreetingTextStyle(),
        ),
        Text(
          "Have a Good Day !",
          style: TextStyles.GreetingText2Style(),
        ),
      ],
    );
  }
}
