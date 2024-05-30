// ignore_for_file: must_be_immutable

import 'package:dev_muscle/components/styles.dart';
import 'package:flutter/material.dart';

class WorkoutCategoriesTabBar extends StatefulWidget {
  TabController tabController;

  WorkoutCategoriesTabBar({super.key, required this.tabController});

  @override
  State<WorkoutCategoriesTabBar> createState() =>
      _WorkoutCategoriesTabBarState();
}

class _WorkoutCategoriesTabBarState extends State<WorkoutCategoriesTabBar>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
          color: Color(0xff2C2C2E), borderRadius: BorderRadius.circular(24)),
      child: TabBar(
        dividerColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        isScrollable: false,
        unselectedLabelColor: Colors.white,
        labelColor: Colors.black,
        labelStyle: TextStyles.WorkoutCategoriesTabTextStyle(),
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: const BoxDecoration(
            color: Color(0xffD0FD3E),
            borderRadius: BorderRadius.all(
              Radius.circular(24),
            )),
        controller: widget.tabController,
        tabs: const [
          Tab(text: "Beginner"),
          Tab(text: "Intermediate"),
          Tab(text: "Advance"),
        ],
      ),
    );
  }
}
