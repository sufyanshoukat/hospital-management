import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:hospital_management/constants/app_colors.dart';
import 'package:hospital_management/constants/app_fonts.dart';
import 'package:hospital_management/constants/app_sizes.dart';
import 'package:hospital_management/constants/app_styling.dart';
import 'package:hospital_management/view/screens/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:hospital_management/view/widget/back_button.dart';
import 'package:hospital_management/view/widget/my_button.dart';
import 'package:hospital_management/view/widget/my_text_widget.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
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
                    paddingBottom: 19,
                    text: "Almost there ",
                    size: 24,
                    weight: FontWeight.w600,
                  ),
                  RichText(
                      text: TextSpan(
                          text:
                              "Please enter the 4-digit code sent to your email ",
                          style: AppStyling().textSpanStyle(
                              fontWeight: FontWeight.w300, fontSize: 14),
                          children: [
                        //-----------------------
                        // Insert User Email Here
                        //-----------------------
                        TextSpan(
                          text: "Johnwalt@gmail.com",
                          style: AppStyling().textSpanStyle(
                              fontWeight: FontWeight.w600,
                              color: kSecondaryColor,
                              fontSize: 14),
                        ),

                        TextSpan(text: " for verification."),
                      ])),

                  SizedBox(height: 31),

                  _OtpFields(onCodeChanged: (code) {}),

                  SizedBox(height: 51),

                  // veerify Button

                  MyButton(
                      buttonText: "Verify",
                      onTap: () {
                        Get.to(() => BottomNavBar());
                      }),

                  SizedBox(height: 26),

                  // Resend Button

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyText(
                        paddingRight: 2,
                        text: 'Didn’t receive any code?',
                        size: 13,
                        weight: FontWeight.w400,
                      ),
                      MyText(
                        onTap: () {},
                        text: 'Resend Again',
                        size: 13,
                        weight: FontWeight.w500,
                        color: kSecondaryColor,
                      ),
                    ],
                  ),
                  // Count Time
                  Align(
                    alignment: Alignment.center,
                    child: MyText(
                      text: 'Request new code in 00:30s',
                      size: 13,
                      weight: FontWeight.w300,
                      color: kBlackColor50Percent,
                    ),
                  ),
                ],
              ))),
    );
  }
}

class _OtpFields extends StatelessWidget {
  final Function(dynamic)? onCodeChanged;
  const _OtpFields({super.key, required this.onCodeChanged});

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 4,
      filled: false,
      fillColor: kTertiaryColor,
      borderColor: kTertiaryColor,
      focusedBorderColor: kBlackColor1,
      borderWidth: 1,
      borderRadius: BorderRadius.circular(50),
      showFieldAsBox: true,
      fieldWidth: 60,
      textStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: kBlackColor1,
          fontFamily: AppFonts.Poppins),
      onCodeChanged: onCodeChanged,
    );
  }
}
