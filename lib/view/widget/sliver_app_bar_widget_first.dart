import 'package:flutter/material.dart';
import 'package:hospital_management/constants/app_colors.dart';
import 'package:hospital_management/constants/app_images.dart';
import 'package:hospital_management/view/widget/back_btn_with_arrow.dart';
import 'package:hospital_management/view/widget/common_image_view_widget.dart';
import 'package:hospital_management/view/widget/my_text_widget.dart';

class SliverAppBarWidegtFirst extends StatelessWidget {
  final bool haveAction;
  final String? title;
  const SliverAppBarWidegtFirst(
      {super.key, this.haveAction = true, this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      toolbarHeight: 100,
      pinned: true,
      expandedHeight: 110,
      backgroundColor: kSecondaryColor,
      //kSecondaryColor,
      leading: Container(
        height: 36,
        width: 36,
        child: Center(child: BackBtnWithArrow()),
      ),
      centerTitle: true,
      title: MyText(
        text: "$title",
        size: 18,
        weight: FontWeight.w500,
        color: kPrimaryColor,
      ),
      actions: [
        haveAction
            ? Container(
                height: 30,
                width: 50,
                child: CommonImageView(
                  imagePath: Assets.imagesAppLogo4,
                  fit: BoxFit.contain,
                  height: 30,
                  width: 49,
                ),
              )
            : SizedBox(),
        SizedBox(width: 10)
      ],
    );
  }
}
