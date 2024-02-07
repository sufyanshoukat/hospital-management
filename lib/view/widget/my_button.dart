import 'package:flutter/material.dart';
import 'package:hospital_management/constants/app_colors.dart';
import 'package:hospital_management/view/widget/my_text_widget.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  MyButton(
      {required this.buttonText,
      required this.onTap,
      this.height = 48,
      this.backgroundColor = kSecondaryColor,
      this.fontColor = kWhiteColor,
      this.fontSize = 16});

  final String buttonText;
  final VoidCallback onTap;
  final double? height;
  final double fontSize;

  final Color backgroundColor, fontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            color: kWhiteColor.withOpacity(0.25),
            blurRadius: 15,
            spreadRadius: 0,
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: kTransperentColor,
        //color: backgroundColor,
        child: InkWell(
          onTap: onTap,
          splashColor: kWhiteColor.withOpacity(0.1),
          highlightColor: kTertiaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(
                text: buttonText,
                size: fontSize,
                color: fontColor,
                weight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
