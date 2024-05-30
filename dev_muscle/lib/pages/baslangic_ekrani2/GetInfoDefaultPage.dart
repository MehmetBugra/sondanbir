// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dev_muscle/components/styles.dart';
import 'package:dev_muscle/pages/main/mainPage.dart';
import 'package:dev_muscle/variables/routes.dart';
import 'package:dev_muscle/widgets/GetInfo_widgets/activityLevel.dart';
import 'package:dev_muscle/widgets/GetInfo_widgets/ageSpinner.dart';
import 'package:dev_muscle/widgets/GetInfo_widgets/genders.dart';
import 'package:dev_muscle/widgets/GetInfo_widgets/goalSpinner.dart';
import 'package:dev_muscle/widgets/GetInfo_widgets/heightSpinner.dart';
import 'package:dev_muscle/widgets/GetInfo_widgets/weightSpinner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetInfoDefaultPage extends StatefulWidget {
  const GetInfoDefaultPage({super.key});

  @override
  State<GetInfoDefaultPage> createState() => _GetInfoDefaultPageState();
}

class _GetInfoDefaultPageState extends State<GetInfoDefaultPage> {
  late int _page = 0;
  late String gender;
  late int age;
  late int weight;
  late int height;
  late String goal;
  late String level;
  final db = FirebaseFirestore.instance;

  final List<String> _titleList = [
    "TELL US ABOUT YOURSELF!",
    "HOW OLD ARE YOU ?",
    "WHAT'S YOUR WEIGHT ?",
    "WHAT'S YOUR HEIGHT?",
    "WHAT'S YOUR GOAL?",
    "PHYSICAL ACTIVITY LEVEL?",
  ];

  @override
  void initState() {
    gender = "Male";
    age = 22;
    weight = 70;
    height = 183;
    goal = "Get Fitter";
    level = "Intermediate";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pageList = [
      Genders(
        onGenderSelected: _onGenderSelected,
      ),
      AgeSpinner(
        onAgeSelected: _onAgeSelected,
      ),
      WeightSpinner(
        onWeightSelected: _onWeightSelected,
      ),
      HeightSpinner(
        onHeightSelected: _onHeightSelected,
      ),
      GoalSpinner(
        onGoalSelected: _onGoalSelected,
      ),
      LevelSpinner(
        onLevelSelected: _onLevelSelected,
      ),
    ];
    return Scaffold(
      backgroundColor: Color(0xff1C1C1E),
      extendBody: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
            ),
            Column(
              children: [
                Text(
                  _titleList[_page],
                  style: TextStyles.GetInfoTitleText(),
                ),
                Text(
                  "Tell about yourself",
                  style: TextStyles.GetInfoSubtitleText(),
                )
              ],
            ),
            SizedBox(
              height: 54,
            ),
            _pageList[_page],
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xff1C1C1E),
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _page > 0
                ? ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _page -= 1;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(20),
                      backgroundColor: Color(0xff1C1C1E),
                    ),
                    child: const Icon(
                      Icons.subdirectory_arrow_left_sharp,
                      color: Colors.white,
                    ),
                  )
                : SizedBox(),
            _page < _pageList.length - 1
                ? ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _page += 1;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffD0FD3E),
                      fixedSize: Size(120, 50),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Next",
                          style: TextStyles.GetInfoNextButtonText(),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.black,
                        )
                      ],
                    ),
                  )
                : ElevatedButton(
                    style: ButtonStyles.RegisterLoginButtonStyle(),
                    onPressed: () {
                      try {
                        Map<Object, Object> data = {
                          "Gender": gender,
                          "Age": age,
                          "Weight": weight,
                          "Height": height,
                          "Goal": goal,
                          "Level": level
                        };
                        db
                            .collection("users")
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .update(data);
                        Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => MainPage(),
                              settings: const RouteSettings(name: mainRoute),
                            ),
                            (route) => false);
                      } on Exception catch (e) {
                        print("hata $e");
                      }
                    },
                    child: Text("Start !")),
          ],
        ),
      ),
    );
  }

  void _onGenderSelected(String selectedGender) {
    setState(() {
      gender = selectedGender;
    });
  }

  void _onAgeSelected(int selectedAge) {
    setState(() {
      age = selectedAge;
    });
  }

  void _onLevelSelected(String selectedLevel) {
    setState(() {
      level = selectedLevel;
    });
  }

  void _onGoalSelected(String selectedGoal) {
    setState(() {
      goal = selectedGoal;
    });
  }

  void _onHeightSelected(int selectedHeight) {
    setState(() {
      height = selectedHeight;
    });
  }

  void _onWeightSelected(int selectedWeight) {
    setState(() {
      weight = selectedWeight;
    });
  }
}
