import 'package:flutter/material.dart';

class appIcon extends StatelessWidget {
  const appIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Color(0xff1C1C1E),
      radius: 50,
      backgroundImage: AssetImage("assets/images/appIcon.png"),
    );
  }
}
