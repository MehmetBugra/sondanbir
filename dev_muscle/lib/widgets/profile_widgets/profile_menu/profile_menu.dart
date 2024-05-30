// ignore_for_file: must_be_immutable

import 'package:dev_muscle/components/styles.dart';
import 'package:dev_muscle/functions/accountFuncs/accountFuncs.dart';
import 'package:dev_muscle/pages/registerAndLogin/page.dart';
import 'package:dev_muscle/variables/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  Map<String, dynamic> userInfo;
  ProfileMenu({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              'Edit Profile',
              style: TextStyles.ProfileMenuTextStyle(),
            ),
            onTap: () {
              Navigator.pushNamed(context, editProfileRoute, arguments: {
                "Name": userInfo["Name"],
                "Surname": userInfo["Surname"],
                "E-Mail": userInfo["E-Mail"],
                "isTrainer": userInfo["isTrainer"],
                "Description": userInfo["Description"],
                "ProfessionField": userInfo["ProfessionField"],
                "PhoneNumber": userInfo["PhoneNumber"],
              });
            },
          ),
          const Divider(),
          ListTile(
            title: Text(
              'Privacy Policy',
              style: TextStyles.ProfileMenuTextStyle(),
            ),
            onTap: () {
              // Privacy policy action
              Navigator.pushNamed(context, privacyPolicyRoute);
            },
          ),
          const Divider(),
          // ListTile(
          //   title: Text(
          //     'Settings',
          //     style: TextStyles.ProfileMenuTextStyle(),
          //   ),
          //   onTap: () {
          //     // Settings action
          //   },
          // ),
          // const Divider(),
          ListTile(
            title: Text(
              'Sign Out',
              style: TextStyles.ProfileSignoutTextStyle(),
            ),
            onTap: () {
              userSignOut().whenComplete(() {
                Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const RegisterAndLoginPage()),
                    ModalRoute.withName(registerAndLoginRoute));
              });
            },
          ),
        ],
      ),
    );
  }
}
