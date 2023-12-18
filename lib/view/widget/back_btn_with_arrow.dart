import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_management/constants/app_colors.dart';
import 'package:hospital_management/constants/app_images.dart';
import 'package:hospital_management/view/widget/common_image_view_widget.dart';
import 'package:hospital_management/view/widget/round_button.dart';

class BackBtnWithArrow extends StatelessWidget {
  final Color bkColor;
  const BackBtnWithArrow({super.key, this.bkColor = kPrimaryColor});

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      onTap: () {
        Get.back();
      },
      height: 36,
      width: 36,
      color: bkColor.withOpacity(0.09),
      widget: CommonImageView(
        svgPath: Assets.imagesBackIcon2,
      ),
    );
  }
}
