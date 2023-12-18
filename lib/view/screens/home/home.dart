import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_management/constants/app_colors.dart';
import 'package:hospital_management/constants/app_images.dart';
import 'package:hospital_management/constants/app_sizes.dart';
import 'package:hospital_management/constants/app_styling.dart';
import 'package:hospital_management/view/screens/home/department_search.dart';
import 'package:hospital_management/view/screens/hospital_and_clinic/clinic.dart';
import 'package:hospital_management/view/screens/hospital_and_clinic/hospital.dart';
import 'package:hospital_management/view/screens/hospital_and_clinic/hospital_detail.dart';
import 'package:hospital_management/view/screens/hospital_and_clinic/search_clinic_or_hospital.dart';
import 'package:hospital_management/view/widget/common_image_view_widget.dart';
import 'package:hospital_management/view/widget/custom_textfield.dart';
import 'package:hospital_management/view/widget/filter_btn.dart';
import 'package:hospital_management/view/widget/main_card.dart';
import 'package:hospital_management/view/widget/my_text_widget.dart';
import 'package:hospital_management/view/widget/round_button.dart';
import 'package:hospital_management/view/widget/treatment_btn.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isAddFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          // App Bar

          _HomeAppBar(
            onNotificationTap: () {},
            onFilterTap: () {},
            onTextFieldTap: () {
              Get.to(() => SearchClinicORHospitals());
            },
          ),

          // Other Content

          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: AppSizes.HORIZONTAL,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        paddingTop: 16,
                        paddingBottom: 12,
                        text: "Department",
                        size: 16,
                        weight: FontWeight.w500,
                      ),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DepartmentButton(
                            onTap: () {},
                            title: "Cardiology",
                          ),
                          DepartmentButton(
                            onTap: () {},
                            title: "Respiratory",
                            svgIcon: Assets.imagesLungsIcon,
                          ),
                          DepartmentButton(
                            onTap: () {},
                            title: "Neurology",
                            svgIcon: Assets.imagesBrainIcon,
                          ),
                          DepartmentButton(
                            onTap: () {
                              Get.to(() => DepartmentSearch());
                            },
                            title: "All",
                            svgIcon: Assets.imagesAllDepartmentsIcon,
                          ),
                        ],
                      ),
                      SizedBox(height: 15),

                      // see all button here

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            paddingBottom: 12,
                            text: "Popular Hospitals",
                            size: 16,
                            weight: FontWeight.w500,
                          ),
                          MyText(
                            onTap: () {
                              Get.to(() => Hospitals());
                            },
                            paddingBottom: 12,
                            text: "See all",
                            size: 12,
                            weight: FontWeight.w500,
                            color: kBlackColor50Percent,
                          ),
                        ],
                      ),

                      // Popular Hospitals

                      SizedBox(
                        height: 158,
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: 2,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, crossAxisSpacing: 13),
                          itemBuilder: (context, index) {
                            return MainCard(
                              onCardTap: () {
                                Get.to(() => HospitalsDetails());
                              },
                              onFavTap: () {
                                isAddFav == false
                                    ? isAddFav = true
                                    : isAddFav = false;
                                setState(() {});
                              },
                              backgroundImg: index.isEven
                                  ? Assets.imagesHospitalImg2
                                  : Assets.imagesHospitalImg3,
                              title: index.isEven
                                  ? "Memorial Hospital"
                                  : "The Adventure",
                              location: "Mubārak al Kabīr, Kuwait",
                              rating: "4.8",
                              isAddFav: isAddFav,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 22),

                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(left: 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Adds(),
                  ),
                ),
                SizedBox(height: 21),

                // Top Clinics

                // see all button here

                Padding(
                  padding: AppSizes.HORIZONTAL,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                        paddingBottom: 12,
                        text: "Top Clinics",
                        size: 16,
                        weight: FontWeight.w500,
                      ),
                      MyText(
                        onTap: () {
                          Get.to(() => Clinic());
                        },
                        paddingBottom: 12,
                        text: "See all",
                        size: 12,
                        weight: FontWeight.w500,
                        color: kBlackColor50Percent,
                      ),
                    ],
                  ),
                ),

                // Popular Hospitals

                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(left: 20),
                    itemCount: 10,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: MainCard(
                        useSmallCard: true,
                        onCardTap: () {},
                        onFavTap: () {
                          isAddFav == false
                              ? isAddFav = true
                              : isAddFav = false;
                          setState(() {});
                        },
                        backgroundImg: index.isEven
                            ? Assets.imagesHospitalImg3
                            : Assets.imagesHospitalImg1,
                        title: index.isEven
                            ? "Smile Clinics"
                            : "Ali Zayed Clinics",
                        location: "Mubārak al Kabīr, Kuwait",
                        rating: "4.8",
                        isAddFav: isAddFav,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 50,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _HomeAppBar extends StatelessWidget {
  final bool haveAction;
  final String? title;
  final VoidCallback onNotificationTap, onFilterTap;
  final bool haveNotification;
  final VoidCallback? onTextFieldTap;

  const _HomeAppBar(
      {super.key,
      this.haveAction = true,
      this.title,
      required this.onNotificationTap,
      required this.onFilterTap,
      this.haveNotification = true,
      this.onTextFieldTap});

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
      backgroundColor: kSecondaryColor,
      leading: Container(
        // color: Colors.amber,
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: CommonImageView(
          imagePath: Assets.imagesAppLogo3,
          fit: BoxFit.contain,
        ),
      ),
      actions: [
        Center(
          child: Stack(
            children: [
              RoundButton(
                  onTap: onNotificationTap,
                  color: kPrimaryColor.withOpacity(0.1),
                  splashRadius: 0,
                  widget: CommonImageView(
                    svgPath: Assets.imagesNotificationIcon,
                  )),
              Positioned(
                  right: 0,
                  child: haveNotification
                      ? Icon(
                          Icons.circle,
                          size: 10,
                          color: kGreenColor,
                        )
                      : SizedBox())
            ],
          ),
        ),
        SizedBox(width: 15),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      onTextFieldTap: onTextFieldTap,
                      readOnly: true,
                      hintText: "Search for treatment...",
                      backgroundColor: kPrimaryColor.withOpacity(0.2),
                      outlineBorderColor: kTransperentColor,
                      borderWidth: 5,
                      hintTextFontColor: kPrimaryColor,
                      hintTextFontSize: 15,
                      prefixIconNeed: true,
                      prefixIcon: Assets.imagesSearchIconPng,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  FilterBtn(
                    onTap: onFilterTap,
                    isBlueBackground: false,
                  )
                ],
              ),
              SizedBox(
                height: 26,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Adds extends StatelessWidget {
  const Adds({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 76,
      width: 219,
      decoration: AppStyling().adsDecoration(),
      child: Center(
        child: MyText(
          text: "Ads",
          size: 14,
          weight: FontWeight.w400,
        ),
      ),
    );
  }
}
