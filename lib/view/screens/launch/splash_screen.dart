import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_management/constants/app_images.dart';
import 'package:hospital_management/view/screens/auth/login/login.dart';
import 'package:hospital_management/view/screens/onboarding/onboarding.dart';
import 'package:hospital_management/view/widget/common_image_view_widget.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreenHandler();
  }

  void splashScreenHandler() {
    Timer(
      Duration(seconds: 2),
      () => Get.offAll(() => OnBoarding()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CommonImageView(
        imagePath: Assets.imagesAppLogo,
        height: 103,
        width: 162,
      )),
    );
  }
}
