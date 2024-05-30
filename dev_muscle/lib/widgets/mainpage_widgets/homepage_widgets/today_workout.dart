import 'package:dev_muscle/components/styles.dart';
import 'package:dev_muscle/functions/exercises/exercises.dart';
import 'package:dev_muscle/variables/routes.dart';
import 'package:dev_muscle/widgets/mainpage_widgets/homepage_widgets/parts/workout_card.dart';
import 'package:flutter/material.dart';

class TodayWorkoutPlan extends StatelessWidget {
  TodayWorkoutPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Today Workout Plan",
              style: TextStyles.HomeLeftSubtitleTextStyle(),
            ),
            Text(
              "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
              style: TextStyles.HomeRightSubtitleTextStyle(),
            ),
          ],
        ),
        const SizedBox(height: 17),
        // WorkoutCard(
        // width: double.infinity,
        // route: workoutPageRoute,
        // exercise: getExercises()["Beginner"][0],
        // ),
      ],
    );
  }
}
