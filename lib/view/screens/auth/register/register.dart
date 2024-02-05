import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_management/constants/app_colors.dart';
import 'package:hospital_management/constants/app_images.dart';
import 'package:hospital_management/constants/app_sizes.dart';
import 'package:hospital_management/constants/app_styling.dart';
import 'package:hospital_management/view/screens/auth/login/login.dart';
import 'package:hospital_management/view/widget/checkbox_widget.dart';
import 'package:hospital_management/view/widget/my_button.dart';
import 'package:hospital_management/view/widget/my_text_widget.dart';
import 'package:hospital_management/view/widget/social_button.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isChecked = false;
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
                haveLogo: false,
                title: "Sign Up",
                subTitle: "Let’s go and start your account!",
              ),
              SizedBox(height: 20),

              TextFieldWithSuffixIcon(
                hint: "Full name",
                suffixIcon: Assets.imagesPersonNameIcon,
                suffixIconHeight: 16,
              ),

              SizedBox(height: 25),

              // Password Field
              TextFieldWithSuffixIcon(
                hint: "Email",
                suffixIcon: Assets.imagesEmailIcon,
                suffixIconHeight: 13,
              ),
              SizedBox(height: 25),
              TextFieldWithSuffixIcon(
                hint: "Strong Password",
                suffixIcon: Assets.imagesLockIcon,
                suffixIconHeight: 14,
              ),

              SizedBox(height: 20),

              MyButton(buttonText: "Sign Up", onTap: () {}),
              SizedBox(height: 15),
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
              SizedBox(height: 30),

              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: kGreyColor2,
                    ),
                  ),
                  MyText(
                    paddingLeft: 10,
                    paddingRight: 10,
                    text: 'or',
                    size: 13,
                    color: kGreyColor2,
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: kGreyColor2,
                    ),
                  )
                ],
              ),
              SizedBox(height: 30),
              SocialButton(
                  svgIcon: Assets.imagesGoogleIcon,
                  buttonText: "Log In with Google",
                  onTap: () {}),
              SizedBox(height: 15),
              SocialButton(
                  svgIcon: Assets.imagesLogosFacebook,
                  buttonText: "Log In with Facebook",
                  onTap: () {}),
              SizedBox(height: 15),
              SocialButton(
                  svgIcon: Assets.imagesPajamasTwitter,
                  buttonText: "Log In with Twitter",
                  onTap: () {}),

              SizedBox(height: 20),

              Row(
                children: [
                  CheckBoxWidget(
                    onChanged: (v) {
                      isChecked = v!;
                      setState(() {});
                    },
                    isChecked: isChecked,
                  ),
                  SizedBox(width: 6),
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
                      ])),
                ],
              ),
            ],
          ),
        ),
      ),

      // Login button and Register Button
    );
  }
}
