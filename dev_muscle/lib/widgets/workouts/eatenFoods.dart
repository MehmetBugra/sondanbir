// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dev_muscle/components/styles.dart';
import 'package:dev_muscle/widgets/workouts/parts/EatenFoodsCard.dart';
import 'package:flutter/material.dart';

class EatenFoods extends StatelessWidget {
  List foods;
  EatenFoods({
    super.key,
    required this.foods,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            " Eaten Foods",
            style: TextStyles.WorkoutsFinishedWorkoutTitleTextStyle(),
          ),
          SizedBox(height: 14),
          SizedBox(
              height: 200,
              width: double.infinity,
              child: foods.isEmpty
                  ? Text(
                      " No Eaten Foods",
                      style: TextStyle(color: Colors.white),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: foods.length,
                      itemBuilder: (context, index) {
                        print(foods);
                        var food = foods[index].value;
                        print(food);
                        return EatenFoodsCard(
                            foodName: food['food_name'],
                            cal: food['cal'],
                            protein: food['protein'],
                            fat: food['fat'],
                            carb: food['carb']);
                      },
                    )),
        ],
      ),
    );
  }
}
