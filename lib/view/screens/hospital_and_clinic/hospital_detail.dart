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
import 'package:hospital_management/view/widget/my_text_widget.dart';
import 'package:hospital_management/view/widget/review_widegt.dart';
import 'package:hospital_management/view/widget/round_button.dart';
import 'package:hospital_management/view/widget/specializations_card.dart';
import 'package:readmore/readmore.dart';

class HospitalsDetails extends StatefulWidget {
  const HospitalsDetails({super.key});

  @override
  State<HospitalsDetails> createState() => _HospitalsDetailsState();
}

class _HospitalsDetailsState extends State<HospitalsDetails>
    with TickerProviderStateMixin {
  // Split the text into lines

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
  bool showReadMore = false;
  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;
    final mH = mQ.height;
    String text =
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.''';

    List<String> lines = text.split("\n");
    if (lines.length > 2 && lines[2].trim().isNotEmpty) {
      showReadMore = true;
    }
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
                        bkColor: kBlackColor1,
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
              physics: NeverScrollableScrollPhysics(),
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
                //-----------------------------------------------
                //-----------------------------------------------
                //-----------------------------------------------
                //-----------------------------------------------
                Wrap(
                  children: [
                    ReadMoreText(
                      'Welcome to Better Care Hospital, where your health and well-being are our top priorities. Our hospital is a beacon of hope, healing,',
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      style: AppStyling().readmoreStyle(
                          color: kBlackColor50Percent, weight: FontWeight.w400),
                      lessStyle: AppStyling().readmoreStyle(),
                      moreStyle: AppStyling().readmoreStyle(),
                    )
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
                SizedBox(height: 12),

                // Tab Bar Secondary

                TabBar.secondary(
                  labelColor: kSecondaryColor,
                  indicatorColor: kSecondaryColor,
                  controller: _tabController,
                  unselectedLabelColor: kBlackColor50Percent,
                  labelStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  tabs: <Widget>[
                    Tab(text: 'Gallery'),
                    Tab(text: 'Doctors'),
                    Tab(text: 'Reviews'),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: mH * 0.4,
                  width: double.maxFinite,
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: [
                      GridView.builder(
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: 10,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                        itemBuilder: (context, index) => CommonImageView(
                          height: 13,
                          width: 107,
                          imagePath: Assets.imagesHospitalImg2,
                          radius: 10,
                        ),
                      ),

                      //Second Widget
                      //------------------------------------
                      // GridView.builder(
                      //     shrinkWrap: true,
                      //     padding: EdgeInsets.zero,
                      //     physics: const BouncingScrollPhysics(),
                      //     itemCount: 10,
                      //     gridDelegate:
                      //         SliverGridDelegateWithFixedCrossAxisCount(
                      //             crossAxisCount: 3,
                      //             crossAxisSpacing: 5,
                      //             mainAxisSpacing: 50),
                      //     itemBuilder: (context, index) => DoctorProfileBtn(
                      //           onTap: () {},
                      //           doctorTitle: "Dr. Tim Brown",
                      //           doctorSubTitle: "Cardiologist",
                      //         )),

                      //-----------------------------------
                      //-----------------------------------
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
                      //Third Widegt
                      //-----------------------------------

                      // height: 50,
                      //color: Colors.red,
                      ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: 3,
                        itemBuilder: (context, index) => ReviewsWidegt(
                          popupOnTap: () {},
                          likeOnTap: () {
                            isLiked ? isLiked = false : isLiked = true;
                            setState(() {});
                          },
                          viewAllOnTap: () {},
                          isLiked: isLiked,
                          profileImg: Assets.imagesProfileImg,
                          title: "James Vince",
                          date: "30 July 2023",
                          reviews:
                              """I recently had to visit Better Care Hospital for a medical procedure, and I was thoroughly impressed with the level of care I received. The medical staff, from the doctors to the nurses, were not only highly skilled but also incredibly compassionate.""",
                          likePersons: "12 person helped",
                        ),
                      ),
                    ],
                  ),
                )
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
