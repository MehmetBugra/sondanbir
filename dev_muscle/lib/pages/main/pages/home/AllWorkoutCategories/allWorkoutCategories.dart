// ignore_for_file: must_be_immutable

import 'package:dev_muscle/components/styles.dart';
import 'package:dev_muscle/variables/colors.dart';
import 'package:dev_muscle/widgets/mainpage_widgets/homepage_widgets/parts/tabbar.dart';
import 'package:dev_muscle/widgets/mainpage_widgets/homepage_widgets/parts/workoutBringer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AllWorkoutCategories extends StatefulWidget {
  AllWorkoutCategories({Key? key}) : super(key: key);

  @override
  State<AllWorkoutCategories> createState() => _AllWorkoutCategoriesState();
}

class _AllWorkoutCategoriesState extends State<AllWorkoutCategories>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color,
      appBar: CupertinoNavigationBar(
        backgroundColor: background_color,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_left),
          color: Colors.white,
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(button_color)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          children: [
            Text(
              "Workout Categories",
              style: TextStyles.AllWorkoutCategoriesTitleTextStyle(),
            ),
            const SizedBox(height: 32),
            WorkoutCategoriesTabBar(tabController: _tabController),
            const SizedBox(height: 16),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 200,
                width: double.infinity,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    WorkoutBringer(
                        level: "beginner", yon: Axis.vertical, all: true),
                    WorkoutBringer(
                        level: "intermediate", yon: Axis.vertical, all: true),
                    WorkoutBringer(
                        level: "advance", yon: Axis.vertical, all: true),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
