import 'package:flutter/material.dart';
import 'package:hospital_management/constants/app_colors.dart';
import 'package:hospital_management/constants/app_images.dart';
import 'package:hospital_management/view/widget/common_image_view_widget.dart';
import 'package:hospital_management/view/widget/my_text_widget.dart';
import 'package:hospital_management/view/widget/round_button.dart';
import 'package:hospital_management/view/widget/sliver_app_bar_widget_first.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  bool isAddFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBarWidegtFirst(
            title: "History",
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _HistoryCard(
                  onCardTap: () {
                    // isAddFav == false ? isAddFav = true : isAddFav = false;
                    // setState(() {});
                  },
                  onFavTap: () {
                    isAddFav == false ? isAddFav = true : isAddFav = false;
                    setState(() {});
                  },
                  backgroundImg: Assets.imagesHospitalImg2,
                  title: "Memorial Hospital",
                  location: "Mubārak al Kabīr, Kuwait",
                  avalibilty: "Check-In Date : XX / XX / XXXX",
                  rating: "4.8",
                  isAddFav: isAddFav,
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: unused_element
class _HistoryCard extends StatelessWidget {
  final bool isAddFav;
  final VoidCallback onCardTap, onFavTap;
  final String? title, location, avalibilty, rating, backgroundImg;
  const _HistoryCard({
    super.key,
    this.isAddFav = false,
    required this.onCardTap,
    required this.onFavTap,
    this.title,
    this.location,
    this.avalibilty,
    this.rating,
    this.backgroundImg,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap,
      child: Container(
        margin: EdgeInsets.only(top: 12, left: 20, right: 20),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 11),
        height: 103,
        decoration: BoxDecoration(
            color: kTertiaryColor, borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image

                Container(
                  height: 83,
                  width: 104,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                          image: AssetImage(
                            backgroundImg.toString(),
                          ),
                          fit: BoxFit.cover)),
                  child: Center(
                    child: Opacity(
                      opacity: .5,
                      child: CommonImageView(
                        imagePath: Assets.imagesAppLogo,
                        height: 30,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 10),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            paddingBottom: 3,
                            text: title.toString(),
                            size: 16,
                            weight: FontWeight.w600,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundButton(
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
                        ],
                      ),

                      // location

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

                      // Doctor Avaliblity

                      MyText(
                        paddingTop: 3,
                        paddingLeft: 3,
                        text: avalibilty.toString(),
                        size: 8,
                        weight: FontWeight.w400,
                        color: kBlackColor50Percent,
                      ),

                      // Rating
                      SizedBox(
                        height: 17,
                      ),

                      Row(
                        children: [
                          CommonImageView(
                            svgPath: Assets.imagesStarFillIcon,
                          ),
                          MyText(
                            paddingLeft: 5,
                            paddingTop: 3,
                            text: rating.toString(),
                            size: 9.91,
                            weight: FontWeight.w400,
                            color: kBlackColor50Percent,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
