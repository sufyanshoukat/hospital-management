import 'package:flutter/material.dart';
import 'package:hospital_management/constants/app_colors.dart';
import 'package:hospital_management/constants/app_images.dart';
import 'package:hospital_management/constants/app_sizes.dart';
import 'package:hospital_management/view/screens/auth/login/login.dart';
import 'package:hospital_management/view/widget/back_btn_with_arrow.dart';
import 'package:hospital_management/view/widget/common_image_view_widget.dart';
import 'package:hospital_management/view/widget/my_text_widget.dart';
import 'package:hospital_management/view/widget/review_widegt.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, bottom: 30, right: 20, left: 20),
            //height: 200,
            decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Row(
              children: [
                BackBtnWithArrow(),
                SizedBox(width: 15),
                Expanded(
                  child: TextFieldWithSuffixIcon(
                    bkColor: kGreyColor1,
                    hint: "Search Clinic",
                    suffixIcon: Assets.imagesCloseSearchIcon,
                    suffixIconHeight: 16,
                  ),
                ),
              ],
            ),
          ),
          MyText(
            paddingLeft: 20,
            paddingTop: 16,
            paddingBottom: 15,
            text: "This Clinic offers heart infection packages",
            size: 14,
            weight: FontWeight.w400,
            color: kBlackColor1,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              padding: AppSizes.DEFAULT,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => _SearchCard(
                img: Assets.imagesClinicImg22,
                title: "The Meadows Heart Clinic",
                rating: "4.9 Ratings  | 1.2k Reviews",
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _SearchCard extends StatelessWidget {
  final String? title, rating, img;
  const _SearchCard({super.key, this.img, this.rating, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 17),
      decoration: BoxDecoration(
          color: kTertiaryColor, borderRadius: BorderRadius.circular(5)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
            child: CommonImageView(
              imagePath: "$img",
              height: 60,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  paddingBottom: 5,
                  text: "$title",
                  size: 14,
                  weight: FontWeight.w500,
                ),
                Row(
                  children: [
                    starWidegt(),
                    starWidegt(),
                    starWidegt(),
                    starWidegt(),
                    starWidegt(),
                    MyText(
                      paddingLeft: 5,
                      text: "$rating",
                      size: 9,
                      weight: FontWeight.w400,
                      color: kBlackColor50Percent,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
