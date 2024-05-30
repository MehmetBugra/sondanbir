// ignore_for_file: must_be_immutable

import 'package:dev_muscle/functions/exercises/exercises.dart';
import 'package:dev_muscle/variables/routes.dart';
import 'package:dev_muscle/widgets/mainpage_widgets/homepage_widgets/parts/workout_card.dart';
import 'package:flutter/material.dart';

class WorkoutBringer extends StatelessWidget {
  String level;
  Axis yon;
  bool all;
  WorkoutBringer({
    Key? key,
    required this.level,
    required this.yon,
    this.all = true,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getExercises(level),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: Text("error"));
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          List exercises = snapshot.data!["exercises"];
          print("aaaaaaaaaaaaaa $exercises");
          return SizedBox(
            height: 200,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: yon,
              itemCount: all ? exercises.length : 2,
              itemBuilder: (context, index) {
                var ex = exercises[index];
                print(ex);
                return WorkoutCard(
                  exercise: ex,
                  width: 350,
                  route: workoutPageRoute,
                );
              },
            ),
          );
        }
      },
    );
  }
}
