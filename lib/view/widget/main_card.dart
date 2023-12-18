// ignore: unused_element
import 'package:flutter/material.dart';
import 'package:hospital_management/constants/app_colors.dart';
import 'package:hospital_management/constants/app_images.dart';
import 'package:hospital_management/view/widget/common_image_view_widget.dart';
import 'package:hospital_management/view/widget/my_text_widget.dart';
import 'package:hospital_management/view/widget/round_button.dart';

class MainCard extends StatelessWidget {
  final bool isAddFav;
  final VoidCallback onCardTap, onFavTap;
  final String? title, location, rating, backgroundImg;
  final bool useSmallCard;
  const MainCard({
    super.key,
    this.isAddFav = false,
    required this.onCardTap,
    required this.onFavTap,
    this.title,
    this.location,
    this.rating,
    this.backgroundImg,
    this.useSmallCard = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap,
      child: Container(
        width: useSmallCard == false ? 157 : 119,
        // margin: EdgeInsets.only(
        //   top: 17,
        // ),
        decoration: BoxDecoration(
            color: kTransperentColor, borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image

            Stack(
              children: [
                Container(
                  height: useSmallCard == false ? 116 : 88,
                  //width: 157,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5)),
                      image: DecorationImage(
                          image: AssetImage(
                            backgroundImg.toString(),
                          ),
                          fit: BoxFit.cover)),
                  child: Center(
                    child: Opacity(
                      opacity: useSmallCard == false ? .8 : 0,
                      child: CommonImageView(
                        imagePath: Assets.imagesAppLogo,
                        height: 30,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 11,
                  child: RoundButton(
                      onTap: onFavTap,
                      color: kPrimaryColor,
                      splashRadius: 0,
                      height: 19.31,
                      widget: CommonImageView(
                        imagePath: isAddFav == false
                            ? Assets.imagesFavIconOutline
                            : Assets.imagesFavIconRed,
                        height: 8,
                      )),
                )
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: MyText(
                    // paddingBottom: 3,
                    text: title.toString(),
                    size: useSmallCard == false ? 12 : 9.13,
                    weight: FontWeight.w600,
                  ),
                ),
                CommonImageView(
                  svgPath: Assets.imagesStarFillIcon,
                ),
                MyText(
                  paddingLeft: 5,
                  //paddingTop: 3,
                  text: rating.toString(),
                  size: 10,
                  weight: FontWeight.w400,
                  color: kBlackColor50Percent,
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                CommonImageView(
                  svgPath: Assets.imagesMapMarkerIcon,
                  height: 7.6,
                ),
                MyText(
                  paddingLeft: 3,
                  text: location.toString(),
                  size: 8,
                  weight: FontWeight.w400,
                  color: kBlackColor50Percent,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
