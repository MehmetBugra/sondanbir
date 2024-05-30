// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:dev_muscle/widgets/intro_widgets/indicator.dart';
import 'package:flutter/material.dart';
import 'package:dev_muscle/components/UIHelper.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  int _selectedIndex = 0;

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print(_selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),
      body: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          setState(() {
            if (_selectedIndex < 2) {
              _selectedIndex++;
            }
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UIHelper.IntroPageChanger(_selectedIndex),
            SizedBox(
              height: 5,
            ),
            myIndicator(
              onItemTapped: onTapped,
              selectedIndex: _selectedIndex,
            ),
          ],
        ),
      ),
    );
  }
}
