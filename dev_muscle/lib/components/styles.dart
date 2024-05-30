// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:dev_muscle/variables/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonStyles {
  _Styles() {}

  static ButtonStyle introButtonStyle() {
    return ButtonStyle(
      // Width ve height özellikleri
      fixedSize: MaterialStateProperty.all<Size>(Size(185, 50)),
      // Padding özellikleri
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.fromLTRB(28, 13, 20, 13),
      ),
      // Border radius özelliği
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(48),
        ),
      ),
      backgroundColor:
          MaterialStateColor.resolveWith((states) => Color(0xFFD0FD3E)),
    );
  }

  static ButtonStyle RegisterLoginButtonStyle() {
    return ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(Color(0xffD0FD3E)),
      textStyle: MaterialStatePropertyAll(TextStyles.RegisterButtonText()),
      fixedSize: MaterialStatePropertyAll(Size(134, 50)),
      alignment: Alignment.center,
      foregroundColor: MaterialStateColor.resolveWith((states) => Colors.black),
    );
  }
}

class TextStyles {
  _TextStyles() {}

  static TextStyle IntroButtonText() {
    return GoogleFonts.openSans(
      fontSize: 17,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle IntroTitleText() {
    return GoogleFonts.openSans(
      fontSize: 24,
      color: Colors.white,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle IntroSubtitleText() {
    return GoogleFonts.openSans(
      fontSize: 24,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle GetInfoTitleText() {
    return GoogleFonts.openSans(
      fontSize: 25,
      color: Colors.white,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle GetInfoSubtitleText() {
    return GoogleFonts.openSans(
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle GetInfoGendersText(bool color) {
    return GoogleFonts.openSans(
      fontSize: 15,
      color: color ? Colors.black : Colors.white,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle GetInfoNextButtonText() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontSize: 17,
      height: -0.03,
    );
  }

  static TextStyle RegisterButtonText() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontSize: 17,
    );
  }

  static TextStyle ForgotPasswordText() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w600,
      color: Color(0xffD0FD3E),
      fontSize: 13,
    );
  }

  static TextStyle TabBarText() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontSize: 13,
    );
  }

  static TextStyle GreetingTextStyle() {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w700,
      color: Colors.white,
      fontSize: 32,
    );
  }

  static TextStyle GreetingText2Style() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w400,
      color: Colors.white,
      fontSize: 15,
    );
  }

  static TextStyle HomeLeftSubtitleTextStyle() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontSize: 17,
    );
  }

  static TextStyle HomeRightSubtitleTextStyle() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w600,
      color: Color(0xffD0FD3E),
      fontSize: 13,
    );
  }

  static TextStyle TodayWorkoutCardTitleTextStyle() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontSize: 17,
    );
  }

  static TextStyle TodayWorkoutCardTimeTextStyle() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w400,
      color: Color(0xffD0FD3E),
      fontSize: 13,
    );
  }

  static TextStyle WorkoutCategoriesTabTextStyle() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w400,
      fontSize: 14,
    );
  }

  static TextStyle WorkoutTitleTextStyle() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      color: Colors.white,
    );
  }

  static TextStyle WorkoutSubtitleTextStyle() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w400,
      fontSize: 13,
      color: Color(0xffD0FD3E),
    );
  }

  static TextStyle WorkoutInfoTextStyle() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w400,
      fontSize: 13,
      color: Colors.white,
    );
  }

  static TextStyle WorkoutDescribeTextStyle() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w400,
      fontSize: 15,
      color: Colors.white,
    );
  }

  static TextStyle WorkoutCardTextStyle() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w600,
      fontSize: 15,
      color: Colors.white,
    );
  }

  static TextStyle AllWorkoutCategoriesTitleTextStyle() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      color: Colors.white,
    );
  }

  static TextStyle WorkoutsCalTextStyle() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w600,
      fontSize: 34,
      color: Colors.white,
    );
  }

  static TextStyle WorkoutsCalSubtitleTextStyle() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w400,
      fontSize: 15,
      color: Colors.white,
    );
  }

  static TextStyle WorkoutsPartsTextStyle() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w600,
      fontSize: 17,
      color: Colors.white,
    );
  }

  static TextStyle WorkoutsPartsSubtitleTextStyle() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: Colors.white,
    );
  }

  static TextStyle WorkoutsFinishedWorkoutTitleTextStyle() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w600,
      fontSize: 17,
      color: Colors.white,
    );
  }

  static TextStyle WorkoutsFinishedWorkoutCardTitleTextStyle() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w600,
      fontSize: 17,
      color: Colors.white,
    );
  }

  static TextStyle WorkoutsFinishedWorkoutCardSubtitleTextStyle() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w400,
      fontSize: 13,
      color: high_green,
    );
  }

  static TextStyle ProfileNameTextStyle() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w700,
      fontSize: 32,
      color: Colors.white,
    );
  }

  static TextStyle ProfileSurnameTextStyle() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w400,
      fontSize: 32,
      color: Colors.white,
    );
  }

  static TextStyle ProfileMenuTextStyle() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w600,
      fontSize: 15,
      color: Colors.white,
    );
  }

  static TextStyle ProfileSignoutTextStyle() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w600,
      fontSize: 17,
      color: Colors.red,
    );
  }

  static TextStyle PrivacyPolicyTitleTextStyle() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w700,
      fontSize: 17,
      color: Colors.white,
    );
  }

  static TextStyle PrivacyPolicyTextStyle() {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      fontSize: 15,
      color: Colors.grey,
    );
  }

  static TextStyle ForgotPasswordTitleTextStyle() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: Colors.white,
    );
  }

  static TextStyle ForgotPasswordSubtitleTextStyle() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w400,
      fontSize: 10,
      color: Colors.white,
    );
  }

  static TextStyle PTCardTitleTextStyle() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w600,
      fontSize: 17,
      color: Colors.white,
    );
  }

  static TextStyle PTCardTitle2TextStyle() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w400,
      fontSize: 11,
      color: Colors.white,
    );
  }

  static TextStyle PTCardSubtitleTextStyle() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w400,
      fontSize: 11,
      color: Color(0xffD0FD3E),
    );
  }

  static TextStyle PTinfoNameTextStyle() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      color: Colors.white,
    );
  }

  static TextStyle PTinfoSubtitleTextStyle() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w400,
      fontSize: 13,
      color: Color(0xffD0FD3E),
    );
  }

  static TextStyle PTinfoDescribeTextStyle() {
    return GoogleFonts.openSans(
      fontWeight: FontWeight.w400,
      fontSize: 13,
      color: Colors.white,
    );
  }
}

class InputDecorations {
  _InputDecorations() {}

  static InputDecoration RegisterLoginInputDec(String label, Color textColor,
      {GestureDetector Function()? isOpen}) {
    return InputDecoration(
        suffix: isOpen == null ? null : isOpen(),
        suffixIconConstraints: BoxConstraints.tight(Size(48, 48)),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffD0FD3E)),
        ),
        label: Text(label),
        labelStyle: TextStyle(color: textColor),
        floatingLabelBehavior: FloatingLabelBehavior.auto);
  }
}
