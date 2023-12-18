import 'package:flutter/material.dart';
import 'package:hospital_management/constants/app_images.dart';
import 'package:hospital_management/view/widget/common_image_view_widget.dart';
import 'package:hospital_management/view/widget/my_text_widget.dart';
import 'package:hospital_management/view/widget/round_button.dart';

class DepartmentButton extends StatelessWidget {
  final VoidCallback onTap;
  final String? title, svgIcon;
  const DepartmentButton(
      {super.key, required this.onTap, this.title, this.svgIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RoundButton(
            onTap: onTap,
            height: 54,
            width: 54,
            widget: CommonImageView(
              svgPath: svgIcon ?? Assets.imagesCardiologyIcon,
            )),
        MyText(
          paddingTop: 9,
          text: title ?? 'title Here',
          size: 10,
          weight: FontWeight.w500,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
