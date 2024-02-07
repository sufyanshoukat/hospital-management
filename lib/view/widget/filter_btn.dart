import 'package:flutter/material.dart';
import 'package:hospital_management/constants/app_colors.dart';
import 'package:hospital_management/constants/app_images.dart';
import 'package:hospital_management/view/widget/common_image_view_widget.dart';

class FilterBtn extends StatelessWidget {
  final VoidCallback onTap;
  final bool isBlueBackground;
  const FilterBtn(
      {super.key, required this.onTap, this.isBlueBackground = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 48,
        decoration: BoxDecoration(
            color: isBlueBackground ? kSecondaryColor : kSecondaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: CommonImageView(
            svgPath: isBlueBackground
                ? Assets.imagesFilterWhiteIcon
                : Assets.imagesFilterIcon,
            svgColor: kWhiteColor,
          ),
        ),
      ),
    );
  }
}
