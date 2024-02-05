import 'package:flutter/material.dart';
import 'package:hospital_management/constants/app_colors.dart';
import 'package:hospital_management/view/widget/common_image_view_widget.dart';
import 'package:hospital_management/view/widget/my_text_widget.dart';

// ignore: must_be_immutable
class SocialButton extends StatelessWidget {
  SocialButton(
      {required this.buttonText,
      required this.onTap,
      this.height = 48,
      this.svgIcon,
      this.marginTop = 0});

  final String buttonText;
  final VoidCallback onTap;
  double? height;
  final String? svgIcon;

  final double marginTop;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTop),
      height: height,
      decoration: BoxDecoration(
          color: kPrimaryColor,
          boxShadow: [
            // BoxShadow(
            //   offset: Offset(0, 4),
            //   color: kSecondaryColor.withOpacity(0.25),
            //   blurRadius: 15,
            //   spreadRadius: 0,
            // ),
          ],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: kSecondaryColor, width: 2)),
      child: Material(
        color: kTransperentColor,
        child: InkWell(
          onTap: onTap,
          splashColor: kPrimaryColor.withOpacity(0.1),
          highlightColor: kTertiaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CommonImageView(
                svgPath: svgIcon,
              ),
              MyText(
                paddingLeft: 13,
                text: buttonText,
                size: 16,
                color: kSecondaryColor,
                weight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
