import 'package:flutter/material.dart';
import 'package:hospital_management/constants/app_colors.dart';
import 'package:hospital_management/constants/app_images.dart';
import 'package:hospital_management/constants/app_sizes.dart';
import 'package:hospital_management/view/screens/hospital_and_clinic/hospital_detail.dart';
import 'package:hospital_management/view/widget/common_image_view_widget.dart';
import 'package:hospital_management/view/widget/my_text_widget.dart';
import 'package:hospital_management/view/widget/review_widegt.dart';
import 'package:hospital_management/view/widget/sliver_app_bar_widget_first.dart';
import 'package:hospital_management/view/widget/specializations_card.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({super.key});

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile>
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

  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: NeverScrollableScrollPhysics(),
        slivers: [
          SliverAppBarWidegtFirst(
            title: "Doctor Profile",
            haveAction: false,
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: AppSizes.DEFAULT,
              child: Column(
                children: [
                  // Doctor Card
                  _DoctorCard(
                    callOnTap: () {},
                    likeOnTap: () {},
                    unLikeOnTap: () {},
                    doctorImg: Assets.imagesProfileImg,
                    doctorTitle: "Dr. Tim Brown",
                    doctorSubTitle: "Cardiology Consultation",
                    doctorRating: "4.9 Ratings ",
                    patients: "2100",
                    doctorExperience: "10 yrs",
                    doctorAddress: "Al Maqwa, Kuwiat",
                  ),
                  SizedBox(height: 20),

                  // Tab Buttons
                  TabBar.secondary(
                    labelColor: kSecondaryColor,
                    indicatorColor: kSecondaryColor,
                    controller: _tabController,
                    unselectedLabelColor: kBlackColor50Percent,
                    labelStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    tabs: <Widget>[
                      Tab(text: 'Photos'),
                      Tab(text: 'Introduction'),
                      Tab(text: 'Reviews'),
                    ],
                  ),

                  SizedBox(height: 20),
                  Container(
                    height: 400,
                    // color: Colors.amber,
                    width: double.maxFinite,
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: [
                        Expanded(
                          child: GridView.builder(
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: 10,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
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
                        ),
                        //Second Widget
                        //------------------------------------

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: "Description",
                              weight: FontWeight.w500,
                              size: 16,
                            ),
                            MyText(
                              paddingTop: 5,
                              text:
                                  """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.""",
                              weight: FontWeight.w400,
                              size: 12,
                              color: kBlackColor50Percent,
                            ),
                            MyText(
                              paddingTop: 18,
                              text: "Specialization",
                              weight: FontWeight.w500,
                              size: 16,
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
                            MyText(
                              paddingTop: 24,
                              text: "Availability",
                              weight: FontWeight.w500,
                              size: 16,
                            ),
                            MyText(
                              paddingTop: 6,
                              text: "10:00 AM - 06:00 PM  (Monday - Friday)",
                              weight: FontWeight.w400,
                              size: 12,
                              color: kBlackColor50Percent,
                            )
                          ],
                        ),

                        //Third Widegt
                        //-----------------------------------
                        ListView.builder(
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
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  SizedBox sH() => SizedBox(height: 17);
}

class _ButtonIcons extends StatelessWidget {
  final VoidCallback onTap;
  final String icon;
  _ButtonIcons({super.key, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.only(right: 8),
          height: 23,
          width: 23,
          decoration: BoxDecoration(color: kGreyColor1, shape: BoxShape.circle),
          child: Center(
            child: CommonImageView(
              imagePath: icon,
              height: 11.5,
            ),
          )),
    );
  }
}

class _TitleAndSubTitle extends StatelessWidget {
  final String? title, subTitle;
  const _TitleAndSubTitle({super.key, this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: "$title",
          weight: FontWeight.w400,
          size: 10,
          color: kBlackColor50Percent,
        ),
        MyText(
          paddingTop: 6,
          text: "$subTitle",
          weight: FontWeight.w500,
          size: 14,
          color: kBlackColor1,
        ),
      ],
    );
  }
}

class _DoctorCard extends StatelessWidget {
  final String? doctorTitle,
      doctorSubTitle,
      doctorRating,
      patients,
      doctorExperience,
      doctorAddress,
      doctorImg;

  final VoidCallback callOnTap, likeOnTap, unLikeOnTap;
  const _DoctorCard({
    super.key,
    required this.callOnTap,
    this.doctorAddress,
    this.doctorExperience,
    this.doctorRating,
    this.doctorSubTitle,
    this.doctorTitle,
    required this.likeOnTap,
    this.patients,
    required this.unLikeOnTap,
    this.doctorImg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 19, vertical: 20),
      decoration: BoxDecoration(
          color: kTertiaryColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Doctor Img------------------

              Container(
                margin: EdgeInsets.only(right: 25),
                height: 87,
                width: 87,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kSecondaryColor,
                    border: Border.all(color: kSecondaryColor, width: 1),
                    image: DecorationImage(
                        image: AssetImage(
                          doctorImg.toString(),
                        ),
                        fit: BoxFit.cover)),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Professional Doctor

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      children: [
                        CommonImageView(
                          imagePath: Assets.imagesPDIcon,
                          height: 8,
                        ),
                        MyText(
                          paddingLeft: 4,
                          text: "Professional Doctor",
                          weight: FontWeight.w400,
                          size: 9,
                          color: kSecondaryColor,
                        )
                      ],
                    ),
                  ),

                  // Doctor Name

                  MyText(
                    paddingTop: 2,
                    text: "$doctorTitle",
                    size: 16,
                    weight: FontWeight.w500,
                  ),

                  // SubTitle

                  MyText(
                    paddingTop: 2,
                    paddingBottom: 2,
                    text: "$doctorSubTitle",
                    size: 10,
                    weight: FontWeight.w400,
                    color: kBlackColor50Percent,
                  ),

                  // rating

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      starWidegt(),
                      starWidegt(),
                      starWidegt(),
                      starWidegt(),
                      starWidegt(),
                      MyText(
                        paddingLeft: 5,
                        text: "$doctorRating",
                        size: 9.58,
                        weight: FontWeight.w400,
                        color: kBlackColor50Percent,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      _ButtonIcons(
                        onTap: callOnTap,
                        icon: Assets.imagesPhoneIconPng,
                      ),
                      //SizedBox(width: 5),
                      _ButtonIcons(
                        onTap: likeOnTap,
                        icon: Assets.imagesBlueLike,
                      ),
                      _ButtonIcons(
                        onTap: unLikeOnTap,
                        icon: Assets.imagesBlueUnlike,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _TitleAndSubTitle(
                title: "Patient",
                subTitle: "$patients+",
              ),
              Container(
                height: 25,
                width: 1,
                color: kBlackColor1.withOpacity(0.1),
              ),
              _TitleAndSubTitle(
                title: "Experience",
                subTitle: "$doctorExperience+",
              ),
              Container(
                height: 25,
                width: 1,
                color: kBlackColor1.withOpacity(0.1),
              ),
              _TitleAndSubTitle(
                title: "Address",
                subTitle: "$doctorAddress",
              ),
            ],
          )
        ],
      ),
    );
  }
}
