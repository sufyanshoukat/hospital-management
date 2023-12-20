import 'package:flutter/material.dart';
import 'package:hospital_management/constants/app_colors.dart';
import 'package:hospital_management/constants/app_images.dart';
import 'package:hospital_management/view/widget/common_image_view_widget.dart';
import 'package:hospital_management/view/widget/my_text_widget.dart';

class ReviewsWidegt extends StatelessWidget {
  final VoidCallback? popupOnTap, likeOnTap, viewAllOnTap;
  final String? title, date, reviews, profileImg, likePersons;
  final bool isLiked;
  const ReviewsWidegt({
    super.key,
    this.popupOnTap,
    this.likeOnTap,
    this.viewAllOnTap,
    this.title,
    this.date,
    this.reviews,
    this.profileImg,
    this.likePersons,
    this.isLiked = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonImageView(
              imagePath: profileImg,
              height: 23.13,
              width: 23.13,
              radius: 50,
            ),
            Column(
              //  mainAxisAlignment: MainAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  paddingLeft: 8,
                  text: "$title",
                  weight: FontWeight.w500,
                  size: 12,
                ),
                SizedBox(height: 1),
                Row(
                  children: [
                    SizedBox(width: 5),
                    starWidegt(),
                    starWidegt(),
                    starWidegt(),
                    starWidegt(),
                    starWidegt(),
                    MyText(
                      paddingLeft: 10,
                      text: "$date",
                      weight: FontWeight.w400,
                      size: 9,
                    ),
                  ],
                ),
                // SizedBox(height: 5),
              ],
            ),
            Expanded(
              child: Container(
                height: 1,
                color: kPrimaryColor,
              ),
            ),
            GestureDetector(
              onTap: popupOnTap,
              child: Icon(
                Icons.more_vert_outlined,
                color: kBlackColor50Percent,
                size: 20,
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 30, right: 28, top: 8.03),
          child: Column(
            children: [
              MyText(
                text: """$reviews""",
                weight: FontWeight.w400,
                size: 10,
                color: kBlackColor50Percent,
              ),
              SizedBox(height: 11.65),
              Row(
                children: [
                  GestureDetector(
                    onTap: likeOnTap,
                    child: CommonImageView(
                      svgPath: (isLiked == false)
                          ? Assets.imagesLikeIconOutline
                          : Assets.imagesLikeFilledIcon,
                    ),
                  ),
                  Expanded(
                    child: MyText(
                      paddingLeft: 7,
                      text: "$likePersons",
                      weight: FontWeight.w400,
                      size: 9,
                      color: kBlackColor50Percent,
                    ),
                  ),
                  GestureDetector(
                    onTap: viewAllOnTap,
                    child: MyText(
                      paddingLeft: 10,
                      text: "View reply",
                      weight: FontWeight.w400,
                      size: 9,
                      color: kBlackColor50Percent,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }
}

class starWidegt extends StatelessWidget {
  const starWidegt({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 2.48,
      ),
      child: CommonImageView(
        svgPath: Assets.imagesStarFillIcon,
        height: 6.61,
      ),
    );
  }
}
