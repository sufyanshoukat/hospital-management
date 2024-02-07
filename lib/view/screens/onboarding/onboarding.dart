import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_management/constants/app_colors.dart';
import 'package:hospital_management/constants/app_images.dart';
import 'package:hospital_management/constants/app_sizes.dart';
import 'package:hospital_management/constants/app_styling.dart';
import 'package:hospital_management/view/screens/auth/login/login.dart';
import 'package:hospital_management/view/screens/auth/register/register.dart';
import 'package:hospital_management/view/widget/common_image_view_widget.dart';
import 'package:hospital_management/view/widget/my_text_widget.dart';
import 'package:hospital_management/view/widget/round_button.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<String> bkImg = [
    Assets.imagesOnboardingImg1,
    Assets.imagesOnboardingImg2,
    Assets.imagesOnboardingImg3
  ];

  List<String> title = [
    'The simplest way toEmpowering Your Health Journey',
    'Finding the best healthcare destination',
    ''
  ];
  List<String> subTitle = [
    'To your destination',
    'To Your Enhanced Healthcare Experience!',
    ''
  ];

  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTransperentColor,
      body: PageView.builder(
        controller: _controller,
        physics: BouncingScrollPhysics(),
        itemCount: bkImg.length,
        itemBuilder: (context, index) {
          return Container(
            padding: AppSizes.DEFAULT,
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: AppStyling().onBoardingBkImg(bkImg[index]),
            child: (index <= 1)
                ?
                // First and Second Page Content

                Column(
                    children: [
                      SizedBox(height: 52),
                      CommonImageView(
                        height: 88,
                        imagePath: Assets.imagesAppLogo3,
                      ),
                      //  Expanded(child: SizedBox(height: 100)),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: title[index],
                              size: 32,
                              weight: FontWeight.w500,
                              color: kWhiteColor,
                            ),
                            MyText(
                              paddingTop: 6,
                              paddingBottom: 63,
                              text: subTitle[index],
                              size: 20,
                              weight: FontWeight.w300,
                              color: kWhiteColor,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 8,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    physics: NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    itemCount: 2,
                                    itemBuilder: (context, i) => _Indecator(
                                      clr: index == i
                                          ? kSecondaryColor
                                          : kWhiteColor,
                                    ),
                                  ),
                                ),
                                RoundButton(
                                    onTap: () {
                                      _controller.nextPage(
                                          duration: Duration(milliseconds: 100),
                                          curve: Curves.bounceOut);
                                    },
                                    height: 50,
                                    width: 50,
                                    color: kSecondaryColor,
                                    widget: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: kWhiteColor,
                                    )),
                              ],
                            ),
                            SizedBox(height: 72),
                          ],
                        ),
                      ),
                    ],
                  )

                // Third Screen Content

                : Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CommonImageView(
                        height: 63,
                        imagePath: Assets.imagesAppLogo,
                      ),
                      MyText(
                        paddingTop: 20,
                        text: "Welcome Back",
                        size: 20,
                        weight: FontWeight.w600,
                      ),
                      MyText(
                        textAlign: TextAlign.center,
                        paddingTop: 2,
                        paddingBottom: 29,
                        text:
                            "Find the best healthcare destinations\nin the world",
                        size: 14,
                        weight: FontWeight.w400,
                        color: kBlackColor50Percent,
                      ),
                      _OutlineButton(
                        onTap: () => Get.to(() => Register()),
                        buttonText: "Start Your Registration",
                      ),
                      SizedBox(height: 26),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyText(
                            text: "Already a member?",
                            size: 14,
                            weight: FontWeight.w400,
                            color: kBlackColor50Percent,
                          ),
                          MyText(
                            onTap: () => Get.to(() => Login()),
                            paddingLeft: 5,
                            text: "Login",
                            size: 14,
                            weight: FontWeight.w600,
                            color: kSecondaryColor,
                          ),
                        ],
                      ),
                      SizedBox(height: 31),
                    ],
                  ),
          );
        },
      ),
    );
  }
}

class _Indecator extends StatelessWidget {
  final Color clr;
  final bool isIndexCorrect;
  const _Indecator(
      {super.key, this.clr = kWhiteColor, this.isIndexCorrect = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      width: 13,
      height: 6,
      decoration: BoxDecoration(
        color: clr,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

// ignore: must_be_immutable
class _OutlineButton extends StatelessWidget {
  _OutlineButton(
      {required this.buttonText,
      required this.onTap,
      this.height = 48,
      this.backgroundColor = kSecondaryColor,
      this.fontColor = kSecondaryColor,
      this.fontSize = 16});

  final String buttonText;
  final VoidCallback onTap;
  final double? height;
  final double fontSize;

  final Color backgroundColor, fontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: kSecondaryColor, width: 1),
        color: kWhiteColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            color: kWhiteColor.withOpacity(0.25),
            blurRadius: 15,
            spreadRadius: 0,
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Material(
        color: kTransperentColor,
        //color: backgroundColor,
        child: InkWell(
          onTap: onTap,
          splashColor: kSecondaryColor.withOpacity(0.1),
          highlightColor: kTertiaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(
                text: buttonText,
                size: fontSize,
                color: fontColor,
                weight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
