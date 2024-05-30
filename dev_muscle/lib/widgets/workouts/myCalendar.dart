import 'package:dev_muscle/variables/colors.dart';
import 'package:dev_muscle/widgets/workouts/carouselCal/carouselCal.dart';
import 'package:flutter/material.dart';

class myCalendar extends StatefulWidget {
  Function(DateTime) onChanged;
  myCalendar({super.key, required this.onChanged});

  @override
  State<myCalendar> createState() => _myCalendarState();
}

class _myCalendarState extends State<myCalendar> {
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: button_color,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(top: 60, left: 24, right: 24, bottom: 24),
        child: carouselCal(
          onChanged: (DateTime date) {
            setState(() {
              _selectedDay = date;
            });
            widget.onChanged(date);
          },
          firstDate: DateTime(2020),
          lastDate: DateTime.now(),
          showYearAlways: true,
          value: _selectedDay,
          selectedTextColor: Colors.black,
          unselectedTextColor: Colors.white,
          selectedColor: high_green,
          unselectedColor: calUnselected_color,
          monthSelectorMargin: EdgeInsets.only(bottom: 30),
          weekdayMargin: EdgeInsets.all(5),
        ),
      ),
    );
  }
}
