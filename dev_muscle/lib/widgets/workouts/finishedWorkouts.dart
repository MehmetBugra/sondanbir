// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:dev_muscle/components/styles.dart';
// import 'package:dev_muscle/functions/exercises/exercises.dart';
// import 'package:dev_muscle/widgets/workouts/parts/FinishedWorkoutsCard.dart';
// import 'package:flutter/material.dart';

// class FinishedWorkouts extends StatelessWidget {
//   FinishedWorkouts({super.key});

//   Map exercises = getBeginnerExercises();

//   @override
//   Widget build(BuildContext context) {
//     num calSum = 0;
//     exercises.forEach(
//       (key, value) {
//         calSum += exercises[key]["cal"];
//       },
//     );
//     return Padding(
//       padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 " Finished Workouts",
//                 style: TextStyles.WorkoutsFinishedWorkoutTitleTextStyle(),
//               ),
//               Text(
//                 " Burned Cal : $calSum",
//                 style: TextStyles.WorkoutsFinishedWorkoutTitleTextStyle(),
//               ),
//             ],
//           ),
//           SizedBox(height: 14),
//           SizedBox(
//             height: 200,
//             width: double.infinity,
//             child: exercises.isNotEmpty
//                 ? ListView.builder(
//                     padding: EdgeInsets.zero,
//                     itemCount: exercises.length,
//                     itemBuilder: (context, index) {
//                       var exercise = exercises[index];
//                       return FinishedWorkoutsCard(
//                         cal: exercise["cal"],
//                         exTitle: exercise["title"],
//                         level: exercise["level"],
//                       );
//                     },
//                   )
//                 : Text("  No Finished Workouts",
//                     style: TextStyle(color: Colors.white)),
//           ),
//         ],
//       ),
//     );
//   }
// }
