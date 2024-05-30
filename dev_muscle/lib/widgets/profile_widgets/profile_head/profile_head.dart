import 'package:dev_muscle/components/styles.dart';
import 'package:flutter/material.dart';

class Profile_Head extends StatelessWidget {
  String name;
  String surname;

  Profile_Head({
    super.key,
    required this.name,
    required this.surname,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: Colors.transparent,
          child: Image.asset(
            "assets/images/pp.png",
            fit: BoxFit.contain,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        const SizedBox(height: 9),
        Text(
          name,
          style: TextStyles.ProfileNameTextStyle(),
        ),
        Text(
          surname,
          style: TextStyles.ProfileSurnameTextStyle(),
        ),
      ],
    );
  }
}
