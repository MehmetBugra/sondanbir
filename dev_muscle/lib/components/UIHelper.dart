import 'package:dev_muscle/pages/main/pages/chat/chatPage.dart';
import 'package:dev_muscle/pages/main/pages/home/home.dart';
import 'package:dev_muscle/pages/main/pages/profile/profile.dart';
import 'package:dev_muscle/pages/main/pages/myWorkouts/workouts.dart';
import 'package:dev_muscle/pages/main/pages/personaltrainersList/ptspage.dart';
import 'package:dev_muscle/widgets/intro_widgets/page.dart';
import 'package:flutter/material.dart';

class UIHelper {
  static Widget PageChanger(int index, userInfo) {
    switch (index) {
      case 0:
        return HomePage(userInfo: userInfo);
      case 1:
        return WorkoutsPage(userInfo: userInfo);
      case 2:
        return PTsPage();
      case 3:
        return ChatPage(
          userInfo: userInfo,
        );
      case 4:
        return ProfilePage(userInfo: userInfo);
      default:
        return const Placeholder();
    }
  }

  static Widget IntroPageChanger(int index) {
    switch (index) {
      case 0:
        return IntroPage("assets/images/intro/intro1.png", "MEET YOUR COACH,",
            "START YOUR JOURNEY", index);
      case 1:
        return IntroPage("assets/images/intro/intro1.png",
            "CREATE A WORKOUT PLAN", "TO STAY FIT", index);
      case 2:
        return IntroPage("assets/images/intro/intro1.png", "ACTION IS THE",
            "KEY TO ALL SUCCESS", index);
      default:
        return const Placeholder();
    }
  }
}
