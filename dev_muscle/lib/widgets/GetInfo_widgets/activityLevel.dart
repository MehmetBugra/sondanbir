import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

class LevelSpinner extends StatefulWidget {
  final Function(String) onLevelSelected;
  const LevelSpinner({super.key, required this.onLevelSelected});

  @override
  State<LevelSpinner> createState() => _LevelSpinnerState();
}

class _LevelSpinnerState extends State<LevelSpinner> {
  int _val = 2;

  List<String> levelList = [
    "Rookie",
    "Beginner",
    "Intermediate",
    "Advance",
    "True Beast",
  ];

  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      minValue: 0,
      maxValue: 4,
      value: _val,
      itemCount: 5,
      textStyle: GoogleFonts.openSans(
          fontWeight: FontWeight.w200, color: Colors.white, fontSize: 20),
      axis: Axis.vertical,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 5, color: Color(0xffD0FD3E)),
          bottom: BorderSide(width: 5, color: Color(0xffD0FD3E)),
        ),
      ),
      selectedTextStyle: GoogleFonts.openSans(
          fontWeight: FontWeight.w600, color: Colors.white, fontSize: 30),
      itemHeight: 70,
      itemWidth: 200,
      textMapper: (numberText) {
        return levelList[int.parse(numberText)];
      },
      onChanged: (value) {
        setState(() {
          _val = value;
          widget.onLevelSelected(levelList[value]);
        });
      },
    );
  }
}
