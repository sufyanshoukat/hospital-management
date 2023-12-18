import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_management/constants/app_colors.dart';
import 'package:hospital_management/constants/app_images.dart';
import 'package:hospital_management/constants/app_sizes.dart';
import 'package:hospital_management/view/screens/auth/login/login.dart';
import 'package:hospital_management/view/screens/forget_password/new_password.dart';
import 'package:hospital_management/view/widget/back_button.dart';
import 'package:hospital_management/view/widget/my_button.dart';
import 'package:hospital_management/view/widget/my_text_widget.dart';

class FogotPassword extends StatefulWidget {
  const FogotPassword({super.key});

  @override
  State<FogotPassword> createState() => _FogotPasswordState();
}

class _FogotPasswordState extends State<FogotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    text: "Forget Password",
                    size: 24,
                    weight: FontWeight.w600,
                  ),
                  MyText(
                    paddingBottom: 41,
                    text: "Enter the email address linked to your account.",
                    size: 14,
                    weight: FontWeight.w300,
                    color: kBlackColor50Percent,
                  ),

                  TextFieldWithSuffixIcon(
                    hint: "Enter your email",
                    suffixIcon: Assets.imagesEmailIcon,
                    suffixIconHeight: 16,
                  ),

                  SizedBox(height: 48),

                  // Submit Button

                  MyButton(
                      buttonText: "Submit",
                      onTap: () {
                        Get.to(NewPassword());
                      }),

                  SizedBox(height: 26),

                  // Support Center Button

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyText(
                        paddingRight: 2,
                        text: 'Forget email or phone number? ',
                        size: 13,
                        weight: FontWeight.w400,
                      ),
                      MyText(
                        onTap: () {},
                        text: 'Support Center',
                        size: 13,
                        weight: FontWeight.w700,
                        color: kSecondaryColor,
                      ),
                    ],
                  ),
                ],
              ))),
    );
  }
}
