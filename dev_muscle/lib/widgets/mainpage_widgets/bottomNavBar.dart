// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  void Function(int value) onPressed;
  int page;
  BottomNavBar({
    super.key,
    required this.onPressed,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,

        // Colors
        useLegacyColorScheme: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        backgroundColor: Colors.transparent,

        // Labels
        showSelectedLabels: false,
        showUnselectedLabels: false,

        // Other
        enableFeedback: false,
        currentIndex: page,
        onTap: onPressed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              size: 30,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insights),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted_rounded),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
          ),
        ],
      ),
    );
  }
}
