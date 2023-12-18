import 'package:flutter/material.dart';
import 'package:hospital_management/constants/app_images.dart';
import 'package:hospital_management/constants/app_sizes.dart';
import 'package:hospital_management/view/widget/main_card.dart';
import 'package:hospital_management/view/widget/simple_app_bar.dart';

class Hospitals extends StatefulWidget {
  const Hospitals({super.key});

  @override
  State<Hospitals> createState() => _HospitalsState();
}

class _HospitalsState extends State<Hospitals> {
  bool isAddFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: "Hospitals"),
      body: Padding(
        padding: AppSizes.DEFAULT,
        child: Expanded(
          child: GridView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 11,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 13, mainAxisSpacing: 11),
            itemBuilder: (context, index) {
              return MainCard(
                onCardTap: () {
                  if (index == 0) {
                    //Get.to(() => Hospitals());
                  } else {
                    //Get.to(() => Hospitals());
                  }
                },
                onFavTap: () {
                  isAddFav == false ? isAddFav = true : isAddFav = false;
                  setState(() {});
                },
                backgroundImg: index.isEven
                    ? Assets.imagesHospitalImg2
                    : Assets.imagesHospitalImg1,
                title: index.isEven ? "Memorial Hospital" : "The Adventure",
                location: "Mubārak al Kabīr, Kuwait",
                rating: "4.8",
                isAddFav: isAddFav,
              );
            },
          ),
        ),
      ),
    );
  }
}
