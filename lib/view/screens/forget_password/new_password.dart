import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_management/constants/app_colors.dart';
import 'package:hospital_management/constants/app_images.dart';
import 'package:hospital_management/constants/app_sizes.dart';
import 'package:hospital_management/view/screens/auth/login/login.dart';
import 'package:hospital_management/view/widget/back_button.dart';
import 'package:hospital_management/view/widget/common_image_view_widget.dart';
import 'package:hospital_management/view/widget/my_button.dart';
import 'package:hospital_management/view/widget/my_text_widget.dart';
import 'package:hospital_management/view/widget/show_dialog_custom.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
          child: Padding(
              padding: AppSizes.DEFAULT,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackBtn(),
                  MyText(
                    paddingTop: 32,
                    paddingBottom: 10,
                    text: "Add New Password",
                    size: 24,
                    weight: FontWeight.w600,
                  ),
                  MyText(
                    paddingBottom: 41,
                    text: "Enter your new password below!",
                    size: 14,
                    weight: FontWeight.w300,
                    color: kBlackColor50Percent,
                  ),

                  TextFieldWithSuffixIcon(
                    hint: "Password",
                    suffixIcon: Assets.imagesLockIcon,
                    suffixIconHeight: 16,
                  ),
                  SizedBox(height: 25),
                  TextFieldWithSuffixIcon(
                    hint: "Conform Password",
                    suffixIcon: Assets.imagesLockIcon,
                    suffixIconHeight: 16,
                  ),

                  SizedBox(height: 43),

                  // Done Button

                  MyButton(
                      buttonText: "Done",
                      onTap: () {
                        // showDialog();
                        showDialogCustom(
                            context: context,
                            widget: _VerficationDialogContent(
                              onTap: () {
                                Get.to(() => Login());
                              },
                            ));
                      }),
                ],
              ))),
    );
  }
}

class _VerficationDialogContent extends StatelessWidget {
  final VoidCallback onTap;
  const _VerficationDialogContent({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonImageView(
          svgPath: Assets.imagesVerificationCompleted,
        ),
        MyText(
          paddingTop: 21,
          paddingBottom: 4,
          text: "Successfully changed",
          size: 18,
          weight: FontWeight.w500,
        ),
        MyText(
          paddingBottom: 22,
          text: "Thanks for your patience. Enjoy\nthe all features of app",
          size: 12,
          weight: FontWeight.w400,
          color: kBlackColor50Percent,
          textAlign: TextAlign.center,
        ),
        MyButton(buttonText: "Done", onTap: onTap)
      ],
    );
  }
}
