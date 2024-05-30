import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numberpicker/numberpicker.dart';

class WeightSpinner extends StatefulWidget {
  final Function(int) onWeightSelected;
  const WeightSpinner({super.key, required this.onWeightSelected});

  @override
  State<WeightSpinner> createState() => WeightSpinnerState();
}

class WeightSpinnerState extends State<WeightSpinner> {
  int _val = 70;
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
        ),
      ),
      selectedTextStyle: GoogleFonts.openSans(
          fontWeight: FontWeight.w600, color: Colors.white, fontSize: 35),
      itemHeight: 70,
      itemWidth: 130,
      textMapper: (numberText) {
        return "$numberText kg";
      },
      onChanged: (value) {
        setState(() {
          _val = value;
          widget.onWeightSelected(value);
        });
      },
    );
  }
}
