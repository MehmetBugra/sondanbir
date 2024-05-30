import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

class HeightSpinner extends StatefulWidget {
  final Function(int) onHeightSelected;
  const HeightSpinner({super.key, required this.onHeightSelected});

  @override
  State<HeightSpinner> createState() => _HeightSpinnerState();
}

class _HeightSpinnerState extends State<HeightSpinner> {
  int _val = 183;
  @override
  Widget build(BuildContext context) {
    return NumberPicker(
      minValue: 14,
      maxValue: 300,
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
          fontWeight: FontWeight.w600, color: Colors.white, fontSize: 35),
      itemHeight: 70,
      itemWidth: 130,
      textMapper: (numberText) {
        return "$numberText cm";
      },
      onChanged: (value) {
        setState(() {
          _val = value;
          widget.onHeightSelected(value);
        });
      },
    );
  }
}
