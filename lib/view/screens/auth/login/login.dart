import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_management/constants/app_colors.dart';
import 'package:hospital_management/constants/app_images.dart';
import 'package:hospital_management/constants/app_sizes.dart';
import 'package:hospital_management/view/screens/auth/otp/otp.dart';
import 'package:hospital_management/view/screens/auth/register/register.dart';
import 'package:hospital_management/view/screens/forget_password/forget_password.dart';
import 'package:hospital_management/view/widget/common_image_view_widget.dart';
import 'package:hospital_management/view/widget/custom_textfield.dart';
import 'package:hospital_management/view/widget/my_button.dart';
import 'package:hospital_management/view/widget/my_text_widget.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            children: [
              // Logo Title & subTitle

              LogoAndText(
                title: "Welcome back",
                subTitle: "sign in to access your account",
              ),

              // Email Field

              TextFieldWithSuffixIcon(
                hint: "Enter your email",
                suffixIcon: Assets.imagesEmailIcon,
                suffixIconHeight: 16,
              ),
              SizedBox(height: 25),

              // Password Field
              TextFieldWithSuffixIcon(
                hint: "Password",
                suffixIcon: Assets.imagesLockIcon,
              ),
              SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    text: "Remember me",
                    color: kBlackColor50Percent,
                    weight: FontWeight.w400,
                    size: 11,
                  ),
                  MyText(
                    onTap: () {
                      Get.to(FogotPassword());
                    },
                    text: "Forget password ?",
                    color: kSecondaryColor,
                    weight: FontWeight.w400,
                    size: 11,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      // Login button and Register Button

      bottomNavigationBar: Container(
        padding: AppSizes.HORIZONTAL,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Login

            MyButton(
                buttonText: "Log In",
                onTap: () {
                  Get.to(OTP());
                }),

            SizedBox(height: 23),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  paddingRight: 4,
                  text: "New Member?",
                  size: 13,
                  weight: FontWeight.w500,
                ),

                // Register

                MyText(
                  onTap: () {
                    Get.to(Register());
                  },
                  text: "Register Now",
                  size: 13,
                  weight: FontWeight.w700,
                  color: kSecondaryColor,
                ),
              ],
            ),
            SizedBox(height: 23),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TextFieldWithSuffixIcon extends StatelessWidget {
  final String? hint, suffixIcon;
  final double? suffixIconHeight;
  final Color bkColor;
  final VoidCallback? onSuffixTap;
  TextEditingController? controller = TextEditingController();
  TextFieldWithSuffixIcon(
      {super.key,
      this.onSuffixTap,
      this.hint,
      this.suffixIcon,
      this.controller,
      this.suffixIconHeight,
      this.bkColor = kTertiaryColor});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller,
      hintText: hint.toString(),
      suffixIconNeed: true,
      suffixIcon: suffixIcon.toString(),
      suffixIconHeight: suffixIconHeight,
      backgroundColor: bkColor,
      onSuffixTap: onSuffixTap,
    );
  }
}

class LogoAndText extends StatelessWidget {
  final String? title, subTitle;
  const LogoAndText({super.key, this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40),
        CommonImageView(
          imagePath: Assets.imagesAppLogo,
          height: 81,
          width: 128,
        ),
        MyText(
          paddingTop: 25,
          text: title.toString(),
          size: 24,
          weight: FontWeight.w600,
          textAlign: TextAlign.center,
        ),
        MyText(
          paddingBottom: 53,
          text: subTitle.toString(),
          size: 14,
          weight: FontWeight.w300,
          color: kBlackColor50Percent,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
