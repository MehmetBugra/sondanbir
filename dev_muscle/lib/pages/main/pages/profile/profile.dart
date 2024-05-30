// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:dev_muscle/widgets/profile_widgets/profile_head/profile_head.dart';
import 'package:dev_muscle/widgets/profile_widgets/profile_menu/profile_menu.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  Map<String, dynamic> userInfo;
  ProfilePage({super.key, required this.userInfo});

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 120, 40, 0),
      child: Column(
        children: [
          Profile_Head(
            name: userInfo["Name"],
            surname: userInfo["Surname"],
          ),
          ProfileMenu(userInfo: userInfo),
        ],
      ),
    );
  }
}
