import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_management/constants/app_colors.dart';
import 'package:hospital_management/constants/app_images.dart';
import 'package:hospital_management/constants/app_sizes.dart';
import 'package:hospital_management/constants/app_styling.dart';
import 'package:hospital_management/view/screens/auth/login/login.dart';
import 'package:hospital_management/view/widget/my_button.dart';
import 'package:hospital_management/view/widget/my_text_widget.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppSizes.DEFAULT,
          child: ListView(
            padding: EdgeInsets.zero,
            physics: BouncingScrollPhysics(),
            children: [
              // Logo Title & subTitle

              LogoAndText(
                title: "Get Started",
                subTitle: "by creating a free account.",
              ),

              TextFieldWithSuffixIcon(
                hint: "Full name",
                suffixIcon: Assets.imagesPersonNameIcon,
                suffixIconHeight: 16,
              ),
              SizedBox(height: 25),

              TextFieldWithSuffixIcon(
                hint: "Valid email",
                suffixIcon: Assets.imagesEmailIcon,
                suffixIconHeight: 16,
              ),
              SizedBox(height: 25),

              // Password Field
              TextFieldWithSuffixIcon(
                hint: "Phone number",
                suffixIcon: Assets.imagesPhoneNumberIcon,
              ),
              SizedBox(height: 25),
              TextFieldWithSuffixIcon(
                hint: "Strong Password",
                suffixIcon: Assets.imagesLockIcon,
              ),
              SizedBox(height: 14),

              RichText(
                  text: TextSpan(
                      text: 'By checking the box you agree to our',
                      style: AppStyling().textSpanStyle(),
                      children: [
                    TextSpan(
                        text: ' Terms',
                        style: TextStyle(color: kSecondaryColor)),
                    TextSpan(text: ' and'),
                    TextSpan(
                        text: ' Conditions',
                        style: TextStyle(color: kSecondaryColor)),
                  ]))
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
            // Register

            MyButton(buttonText: "Register", onTap: () {}),

            SizedBox(height: 23),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  paddingRight: 4,
                  text: "Already a member?",
                  size: 13,
                  weight: FontWeight.w500,
                ),

                // Login In

                MyText(
                  onTap: () {
                    Get.to(Login());
                  },
                  text: "Log In",
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
