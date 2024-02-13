import 'package:flutter/material.dart';
import 'package:hospital_management/constants/app_colors.dart';

class RoundButton extends StatelessWidget {
  final double height, width, splashRadius;
  final Color color, splashColor;
  final VoidCallback onTap;
  final Widget widget;

  const RoundButton(
      {super.key,
      this.height = 36,
      this.width = 36,
      this.color = kWhiteColor,
      required this.onTap,
      required this.widget,
      this.splashColor = kBlackColor1,
      this.splashRadius = 36});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Material(
        color: kTransperentColor,
        child: InkWell(
          onTap: onTap,
          radius: splashRadius,
          splashColor: splashColor.withOpacity(.1),
          borderRadius: BorderRadius.circular(50),
          child: Center(child: widget),
        ),
      ),
    );
  }
}
