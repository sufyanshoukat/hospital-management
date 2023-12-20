import 'package:flutter/material.dart';
import 'package:hospital_management/constants/app_colors.dart';
import 'package:hospital_management/constants/app_fonts.dart';

class AppStyling {
  textSpanStyle(
      {double fontSize = 9,
      FontWeight fontWeight = FontWeight.w400,
      Color color = kBlackColor1}) {
    return TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: AppFonts.Poppins);
  }

  settingCardDecoration() {
    return BoxDecoration(
        color: kSecondaryColor, borderRadius: BorderRadius.circular(7.84));
  }

  BoxDecoration adsDecoration() {
    return BoxDecoration(
      color: kTertiaryColor,
      borderRadius: BorderRadius.circular(3.81),
    );
  }

  BoxDecoration hospitalCardDecoration() {
    return BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)));
  }




    BoxDecoration onBoardingBkImg(img) {
    return BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.cover));
  }
}
