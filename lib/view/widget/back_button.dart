import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_management/constants/app_images.dart';
import 'package:hospital_management/view/widget/common_image_view_widget.dart';
import 'package:hospital_management/view/widget/round_button.dart';

class BackBtn extends StatelessWidget {
  
  const BackBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RoundButton(
    
        onTap: () {
          Get.back();
        },
        widget: CommonImageView(
          svgPath: Assets.imagesBackIcon1,
        ));
  }
}
