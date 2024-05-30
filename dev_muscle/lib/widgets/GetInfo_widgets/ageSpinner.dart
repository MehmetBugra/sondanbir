import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

class AgeSpinner extends StatefulWidget {
  final Function(int) onAgeSelected;
  const AgeSpinner({super.key, required this.onAgeSelected});

  @override
  State<AgeSpinner> createState() => _AgeSpinnerState();
}

class _AgeSpinnerState extends State<AgeSpinner> {
  int _age = 30;
  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      minValue: 14,
      maxValue: 100,
      value: _age,
      itemCount: 5,
      textStyle: GoogleFonts.openSans(
          fontWeight: FontWeight.w200, color: Colors.white, fontSize: 25),
      axis: Axis.vertical,
      decoration: const BoxDecoration(
          border: Border(
        top: BorderSide(width: 3, color: Color(0xffD0FD3E)),
        bottom: BorderSide(width: 3, color: Color(0xffD0FD3E)),
      )),
      // haptics: false,
      selectedTextStyle: GoogleFonts.openSans(
          fontWeight: FontWeight.w600, color: Colors.white, fontSize: 50),
      itemHeight: 70,
      itemWidth: 113,
      onChanged: (value) {
        setState(() {
          _age = value;
          widget.onAgeSelected(value);
        });
      },
    );
  }
}
