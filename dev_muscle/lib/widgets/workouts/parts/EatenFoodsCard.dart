import 'package:dev_muscle/components/styles.dart';
import 'package:dev_muscle/variables/colors.dart';
import 'package:flutter/material.dart';

class EatenFoodsCard extends StatelessWidget {
  String foodName;
  int cal;
  int protein;
  int fat;
  int carb;
  EatenFoodsCard({
    super.key,
    required this.foodName,
    required this.cal,
    required this.protein,
    required this.fat,
    required this.carb,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: button_color,
      child: ListTile(
        title: Text(
          foodName,
          style: TextStyles.WorkoutsFinishedWorkoutCardTitleTextStyle(),
        ),
        subtitle: Text(
          "CAL: $cal | PROT: $protein | FAT: $fat | CARB: $carb",
          style: TextStyles.WorkoutsFinishedWorkoutCardSubtitleTextStyle(),
        ),
        trailing: Icon(Icons.check_box, color: high_green),
      ),
    );
  }
}
