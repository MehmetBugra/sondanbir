import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

class GoalSpinner extends StatefulWidget {
  final Function(String) onGoalSelected;
  const GoalSpinner({super.key, required this.onGoalSelected});

  @override
  State<GoalSpinner> createState() => _GoalSpinnerState();
}

class _GoalSpinnerState extends State<GoalSpinner> {
  int _val = 2;

  List<String> goalList = [
    "Gain Weight",
    "Lose Weight",
    "Get Fitter",
    "Gain Flexible",
    "Learn Basic"
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
      )),
      selectedTextStyle: GoogleFonts.openSans(
          fontWeight: FontWeight.w600, color: Colors.white, fontSize: 30),
      itemHeight: 70,
      itemWidth: 200,
      textMapper: (numberText) {
        return goalList[int.parse(numberText)];
      },
      onChanged: (value) {
        setState(() {
          _val = value;
          widget.onGoalSelected(goalList[value]);
        });
      },
    );
  }
}
