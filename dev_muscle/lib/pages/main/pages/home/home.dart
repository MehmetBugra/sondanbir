// ignore_for_file: must_be_immutable

import 'package:dev_muscle/widgets/mainpage_widgets/homepage_widgets/greeting.dart';
import 'package:dev_muscle/widgets/mainpage_widgets/homepage_widgets/today_workout.dart';
import 'package:dev_muscle/widgets/mainpage_widgets/homepage_widgets/workout_categories/workout_categories.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Map<String, dynamic> userInfo;
  HomePage({super.key, required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 60, 24, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GreetingText(name: userInfo["Name"]),
            const SizedBox(height: 32),
            TodayWorkoutPlan(),
            const SizedBox(height: 32),
            WorkoutCategories(),
          ],
        ),
      ),
    );
  }
}
