import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hospital_management/constants/app_images.dart';
import 'package:hospital_management/constants/app_sizes.dart';
import 'package:hospital_management/view/screens/hospital_and_clinic/clinic_detail.dart';
import 'package:hospital_management/view/widget/main_card.dart';
import 'package:hospital_management/view/widget/simple_app_bar.dart';

class Clinic extends StatefulWidget {
  const Clinic({super.key});

  @override
  State<Clinic> createState() => _ClinicState();
}

class _ClinicState extends State<Clinic> {
  bool isAddFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: "Clinic"),
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
                  Get.to(() => ClinicDetails());
                },
                onFavTap: () {
                  isAddFav == false ? isAddFav = true : isAddFav = false;
                  setState(() {});
                },
                backgroundImg: index.isEven
                    ? Assets.imagesHospitalImg1
                    : Assets.imagesHospitalImg2,
                title: index.isEven ? "Schweizer Clinics" : "Ali Zayed Clinics",
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
