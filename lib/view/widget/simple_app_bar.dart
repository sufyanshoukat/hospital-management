import 'package:flutter/material.dart';
import 'package:hospital_management/constants/app_colors.dart';
import 'package:hospital_management/constants/app_images.dart';
import 'package:hospital_management/view/widget/back_button.dart';
import 'package:hospital_management/view/widget/common_image_view_widget.dart';
import 'package:hospital_management/view/widget/my_text_widget.dart';

simpleAppBar({required String title}) {
  return AppBar(
    backgroundColor: kPrimaryColor,
    surfaceTintColor: kPrimaryColor,
    leading: Center(child: BackBtn()),
    leadingWidth: 70,
    title: MyText(
      text: title,
      size: 18,
      weight: FontWeight.w500,
    ),
    centerTitle: true,
    actions: [
      Center(
        child: CommonImageView(
          imagePath: Assets.imagesAppLogo6,
          height: 27,
        ),
      ),
      SizedBox(
        width: 20,
      )
    ],
  );
}
