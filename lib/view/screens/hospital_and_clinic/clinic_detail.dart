import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_management/constants/app_colors.dart';
import 'package:hospital_management/constants/app_images.dart';
import 'package:hospital_management/constants/app_sizes.dart';
import 'package:hospital_management/constants/app_styling.dart';
import 'package:hospital_management/view/screens/doctor_profile/doctor_profile.dart';
import 'package:hospital_management/view/widget/back_btn_with_arrow.dart';
import 'package:hospital_management/view/widget/common_image_view_widget.dart';
import 'package:hospital_management/view/widget/doctor_profile_btn.dart';
import 'package:hospital_management/view/widget/my_button.dart';
import 'package:hospital_management/view/widget/my_text_widget.dart';
import 'package:hospital_management/view/widget/round_button.dart';
import 'package:hospital_management/view/widget/specializations_card.dart';

class ClinicDetails extends StatefulWidget {
  const ClinicDetails({super.key});

  @override
  State<ClinicDetails> createState() => _ClinicDetailsState();
}

class _ClinicDetailsState extends State<ClinicDetails>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  bool isFav = false;
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kTransperentColor,
      body: Stack(
        children: [
          // Image Section
          Container(
            height: 300,
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Assets.imagesHospitalImg1),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: AppSizes.DEFAULT,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BackBtnWithArrow(
                        iconColor: kPrimaryColor,
                        bkColor: kPrimaryColor,
                      ),
                      RoundButton(
                          onTap: () {},
                          color: kSecondaryColor,
                          splashRadius: 0,
                          widget: CommonImageView(
                            svgPath: isFav == false
                                ? Assets.imagesFavFillWhiteIcon
                                : Assets.imagesFillRedSvg,
                          )),
                    ],
                  ),
                  Center(
                    child: Opacity(
                      opacity: .5,
                      // child: Padding(
                      // padding: EdgeInsets.only(top: 50),
                      child: CommonImageView(
                        imagePath: Assets.imagesAppLogo,
                        height: 70,
                      ),
                      //),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //-------------------- Other Content Section -----------
          //------------------------------------------------------

          Container(
            margin: EdgeInsets.only(top: 220),
            // width: double.maxFinite,
            decoration: AppStyling().hospitalCardDecoration(),

            child: ListView(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: AppSizes.DEFAULT,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        CommonImageView(
                          svgPath: Assets.imagesStarFillIcon,
                        ),
                        SizedBox(width: 5),
                        CommonImageView(
                          svgPath: Assets.imagesStarFillIcon,
                        ),
                        SizedBox(width: 5),
                        CommonImageView(
                          svgPath: Assets.imagesStarFillIcon,
                        ),
                        SizedBox(width: 5),
                        CommonImageView(
                          svgPath: Assets.imagesStarFillIcon,
                        ),
                        SizedBox(width: 5),
                        CommonImageView(
                          svgPath: Assets.imagesStarFillIcon,
                        ),
                      ],
                    ),
                    MyText(
                      paddingLeft: 6,
                      text: "4.9 Ratings  | 1.2k Reviews",
                      size: 9.58,
                      color: kBlackColor50Percent,
                      weight: FontWeight.w400,
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                      text: "Better Care Hospital",
                      size: 22,
                      color: kBlackColor1,
                      weight: FontWeight.w600,
                    ),
                    RoundButton(
                        onTap: () {},
                        widget: CommonImageView(
                          imagePath: Assets.imagesPhoneIconPng,
                          height: 18,
                        ))
                  ],
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    CommonImageView(
                      svgPath: Assets.imagesMapMarkerIcon,
                      //height: 18,
                    ),
                    MyText(
                      paddingLeft: 11.15,
                      text: "Al Maqwa, Kuwait",
                      size: 11.15,
                      color: kBlackColor50Percent,
                      weight: FontWeight.w400,
                    ),
                  ],
                ),
                MyText(
                  paddingTop: 16.36,
                  paddingBottom: 12,
                  text: "Description",
                  size: 16,
                  color: kBlackColor1,
                  weight: FontWeight.w500,
                ),
                Wrap(
                  children: [
                    MyText(
                      text:
                          """Welcome to Better Care Hospital, where your health and well-being are our top priorities. Our hospital is a beacon of hope, healing, and... Read More""",
                      size: 11.15,
                      color: kBlackColor50Percent,
                      weight: FontWeight.w400,
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: SpecializationCard(
                        specialization: "Cardiology",
                      ),
                    ),
                    width(),
                    Expanded(
                      child: SpecializationCard(
                        specialization: "Dermatology",
                      ),
                    ),
                    width(),
                    Expanded(
                      child: SpecializationCard(
                        specialization: "Brain Specialist",
                      ),
                    ),
                    width(),
                    Expanded(
                      child: SpecializationCard(
                        specialization: "Cardiology",
                      ),
                    )
                  ],
                ),
                // SizedBox(height: 12),
                MyText(
                  paddingTop: 32,
                  text: "Doctors Available",
                  size: 16,
                  color: kBlackColor1,
                  weight: FontWeight.w500,
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DoctorProfileBtn(
                      onTap: () {
                        Get.to(() => DoctorProfile());
                      },
                      doctorTitle: "Dr. Tim Brown",
                      doctorSubTitle: "Cardiologist",
                    ),
                    DoctorProfileBtn(
                      onTap: () {
                        Get.to(() => DoctorProfile());
                      },
                      doctorTitle: "Dr. Tim Brown",
                      doctorSubTitle: "Cardiologist",
                    ),
                    DoctorProfileBtn(
                      onTap: () {
                        Get.to(() => DoctorProfile());
                      },
                      doctorTitle: "Dr. Tim Brown",
                      doctorSubTitle: "Cardiologist",
                    ),
                  ],
                ),

                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  height: 120,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage(
                            Assets.imagesMap,
                          ),
                          fit: BoxFit.cover)),
                  child: Center(
                      child: MyButton(
                          height: 44, buttonText: "Location", onTap: () {})),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

SizedBox width() => SizedBox(width: 8);

// ignore: unused_element
class _HospitalDetailAppBar extends StatelessWidget {
  final String? bkImg;
  final VoidCallback onFavTap;
  final bool isFav;

  const _HospitalDetailAppBar({
    // ignore: unused_element
    super.key,
    // ignore: unused_element
    this.bkImg,
    required this.onFavTap,
    // ignore: unused_element
    this.isFav = false,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      toolbarHeight: 70,
      pinned: true,
      expandedHeight: 193,
      leadingWidth: 100,
      stretchTriggerOffset: 100,
      backgroundColor: kSecondaryColor,
      leading: Container(
          child: Center(
              child: BackBtnWithArrow(
        bkColor: kBlackColor1,
      ))),
      actions: [
        Center(
          child: RoundButton(
              onTap: onFavTap,
              color: kSecondaryColor,
              splashRadius: 0,
              widget: CommonImageView(
                svgPath: isFav == false
                    ? Assets.imagesFavFillWhiteIcon
                    : Assets.imagesFillRedSvg,
              )),
        ),
        SizedBox(width: 15),
      ],
      flexibleSpace: FlexibleSpaceBar(
          background: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("$bkImg"), fit: BoxFit.cover)),
        child: Center(
          child: Opacity(
            opacity: .5,
            child: Padding(
              padding: EdgeInsets.only(top: 50),
              child: CommonImageView(
                imagePath: Assets.imagesAppLogo,
                height: 70,
              ),
            ),
          ),
        ),
      )

          //     CommonImageView(
          //   imagePath: bkImg,
          // )

          ),
    );
  }
}
