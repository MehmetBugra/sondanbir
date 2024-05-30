// ignore_for_file: must_be_immutable

import 'package:dev_muscle/components/styles.dart';
import 'package:dev_muscle/functions/foods/foodCalc.dart';
import 'package:dev_muscle/functions/foods/foods.dart';
import 'package:dev_muscle/pages/main/pages/myWorkouts/addFoodPage.dart';
import 'package:dev_muscle/variables/colors.dart';
import 'package:dev_muscle/widgets/workouts/calories.dart';
import 'package:dev_muscle/widgets/workouts/circle.dart';
import 'package:dev_muscle/widgets/workouts/eatenFoods.dart';
// import 'package:dev_muscle/widgets/workouts/finishedWorkouts.dart';
import 'package:dev_muscle/widgets/workouts/myCalendar.dart';
import 'package:flutter/material.dart';

class WorkoutsPage extends StatefulWidget {
  Map<String, dynamic> userInfo;
  WorkoutsPage({super.key, required this.userInfo});

  @override
  State<WorkoutsPage> createState() => _WorkoutsPageState();
}

class _WorkoutsPageState extends State<WorkoutsPage> {
  late int _year;
  late int _month;
  late int _day;
  late int userKg;

  @override
  void initState() {
    _year = DateTime.now().year;
    _month = DateTime.now().month;
    _day = DateTime.now().day;
    userKg = widget.userInfo["Weight"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          myCalendar(
            onChanged: calendarOnChanged,
          ),
          FutureBuilder(
            future: getFoodData(_year, _month, _day),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text("Error."));
              } else {
                double carb = 0;
                double protein = 0;
                double fat = 0;
                double cal = 0;
                Map<String, dynamic> userInf = widget.userInfo;
                Map<String, dynamic> requiredFood = CalculateFood(
                    userInf["Weight"],
                    userInf["Height"],
                    userInf["Goal"],
                    userInf["Gender"],
                    userInf["Age"]);
                Map<String, dynamic> data = snapshot.data!;
                data.forEach((key, value) {
                  carb += value['carb'];
                  protein += value['protein'];
                  fat += value['fat'];
                  cal += value['cal'];
                });

                return Column(
                  children: [
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Column(
                        children: [
                          Calories(
                              calValue: cal, maxValue: requiredFood["cal"]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleParts(
                                  label: "Protein",
                                  val: protein,
                                  max: requiredFood["protein"]),
                              CircleParts(
                                  label: "Carb",
                                  val: carb,
                                  max: requiredFood["carb"]),
                              CircleParts(label: "Fat", val: fat, max: 100),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    DateTime.now().day == _day
                        ? ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => high_green),
                                textStyle: MaterialStatePropertyAll(
                                    TextStyles.IntroButtonText())),
                            onPressed: () {
                              showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) => const AddFoodPage(),
                              ).whenComplete(() => setState(() {}));
                            },
                            child: const Text("Add Food"))
                        : const SizedBox(),
                    EatenFoods(foods: data.entries.toList()),
                    const SizedBox(height: 30),
                    // FinishedWorkouts(),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  void calendarOnChanged(DateTime val) {
    setState(() {
      _year = val.year;
      _month = val.month;
      _day = val.day;
    });
  }
}
