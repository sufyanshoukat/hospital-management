import 'package:flutter/material.dart';
import 'package:hospital_management/constants/app_colors.dart';
import 'package:hospital_management/constants/app_images.dart';
import 'package:hospital_management/view/widget/common_image_view_widget.dart';
import 'package:hospital_management/view/widget/my_text_widget.dart';
import 'package:hospital_management/view/widget/review_widegt.dart';

class DoctorProfileBtn extends StatelessWidget {
  final VoidCallback? onTap;
  final String? doctorTitle, doctorSubTitle;
  const DoctorProfileBtn(
      {super.key, this.doctorSubTitle, this.doctorTitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          //color: Colors.amber,
          // width: 110,
          height: 135,
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    height: 101,
                    // width: 107,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      border: Border.all(color: kSecondaryColor),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          paddingBottom: 2,
                          text: "$doctorTitle",
                          size: 10,
                          weight: FontWeight.w500,
                        ),
                        MyText(
                          paddingBottom: 2,
                          text: "$doctorTitle",
                          size: 8,
                          weight: FontWeight.w400,
                          color: kBlackColor50Percent,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            starWidegt(),
                            starWidegt(),
                            starWidegt(),
                            starWidegt(),
                            starWidegt(),
                          ],
                        )
                      ],
                    ),
                  ),
                  //SizedBox(height: 20),
                ],
              ),
              Positioned(
                left: 35,
                child: Container(
                  padding: EdgeInsets.all(3),
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      border: Border.all(color: kTertiaryColor, width: 2),
                      borderRadius: BorderRadius.circular(10)),
                  child: CommonImageView(
                    imagePath: Assets.imagesProfileImg,
                    radius: 5,
                    height: 34,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 35,
                child: GestureDetector(
                  onTap: onTap,
                  child: Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kPrimaryColor,
                        border: Border.all(color: kSecondaryColor, width: 1),
                      ),
                      child: Center(
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kSecondaryColor,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 10,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
