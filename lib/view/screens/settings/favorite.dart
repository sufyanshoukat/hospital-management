import 'package:flutter/material.dart';
import 'package:hospital_management/constants/app_images.dart';
import 'package:hospital_management/view/widget/main_card.dart';
import 'package:hospital_management/view/widget/sliver_app_bar_widget_first.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool isAddFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBarWidegtFirst(
            title: "Favorite",
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 17),
            sliver: SliverGrid.builder(
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 17, crossAxisSpacing: 13, crossAxisCount: 2),
              itemBuilder: (context, index) => MainCard(
                onCardTap: () {},
                onFavTap: () {
                  isAddFav == false ? isAddFav = true : isAddFav = false;
                  setState(() {});
                },
                backgroundImg: Assets.imagesHospitalImg2,
                title: "Memorial Hospital",
                location: "Mubārak al Kabīr, Kuwait",
                rating: "4.8",
                isAddFav: isAddFav,
              ),
            ),
          )
        ],
      ),
    );
  }
}
