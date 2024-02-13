import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_management/constants/app_colors.dart';
import 'package:hospital_management/constants/app_images.dart';
import 'package:hospital_management/constants/app_sizes.dart';
import 'package:hospital_management/constants/app_styling.dart';
import 'package:hospital_management/view/screens/home/department_search.dart';
import 'package:hospital_management/view/screens/hospital_and_clinic/clinic.dart';
import 'package:hospital_management/view/screens/hospital_and_clinic/clinic_detail.dart';
import 'package:hospital_management/view/screens/hospital_and_clinic/hospital.dart';
import 'package:hospital_management/view/screens/hospital_and_clinic/hospital_detail.dart';
import 'package:hospital_management/view/screens/hospital_and_clinic/search_screen.dart';
import 'package:hospital_management/view/screens/settings/notification.dart';
import 'package:hospital_management/view/widget/common_image_view_widget.dart';
import 'package:hospital_management/view/widget/custom_dropdown_widget.dart';
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
  int currentIndex = 0;
  bool isAddFav = false;
  List<String> ratingText = ['NONE', '1', '2', '3', '4', '5'];
  @override
  Widget build(BuildContext context) {
    final sizeM = MediaQuery.of(context).size;
    final mH = sizeM.height;

    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          // App Bar

          _HomeAppBar(
            onNotificationTap: () {
              Get.to(() => NotificationPage());
            },
            onFilterTap: () {
              // Bottom Sheet
              filterBottomSheet();
            },
            onTextFieldTap: () {
              Get.to(() => SearchScreen());
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

                      Container(
                        //color: Colors.amber,
                        height: mH * 0.2,
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

                // Ads
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
                        onCardTap: () {
                          Get.to(() => ClinicDetails());
                        },
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

  Future<dynamic> filterBottomSheet() {
    return Get.bottomSheet(Container(
      decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      padding: AppSizes.DEFAULT,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(bottom: 19),
              height: 3,
              width: 60,
              decoration: BoxDecoration(
                  color: kBlackColor1, borderRadius: BorderRadius.circular(20)),
            ),
          ),
          // top 3 Buttons

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                onTap: () {},
                text: "Cancel",
                weight: FontWeight.w500,
                size: 14,
                color: kSecondaryColor,
              ),
              MyText(
                text: "Filter",
                weight: FontWeight.w500,
                size: 20,
              ),
              MyText(
                onTap: () {},
                text: "Reset",
                weight: FontWeight.w500,
                size: 14,
                color: kSecondaryColor,
              ),
            ],
          ),

          // Drop Downs
          SizedBox(height: 27),
          CustomDropDown(
            onChanged: (value) {},
            items: ['item 1', 'item 2', 'item 3'],
            label: "Select City",
            hint: "Al Maqwa",
          ),
          height(),
          CustomDropDown(
            onChanged: (value) {},
            items: ['item 1', 'item 2', 'item 3'],
            label: "Select Specialty",
            hint: "Brain Specialist",
          ),
          height(),
          CustomDropDown(
            onChanged: (value) {},
            items: ['item 1', 'item 2', 'item 3'],
            label: "Sort by",
            hint: "Price",
          ),
          height(),
          MyText(
            paddingBottom: 10,
            text: "Rtings",
            size: 12,
            weight: FontWeight.w400,
            color: kBlackColor1,
          ),

          SizedBox(
            height: 30,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context, index) {
                return _RatingButtons(
                  onTap: () {
                    currentIndex = index;
                    // setState(() {});
                  },
                  buttonText: ratingText[index],
                  isStarVisible: index == 0 ? false : true,
                  fillColor: (index == currentIndex)
                      ? kSecondaryColor
                      : kTransperentColor,
                  borderColor: (index == currentIndex)
                      ? kTransperentColor
                      : kBlackColor1,
                  textColor:
                      (index == currentIndex) ? kWhiteColor : kBlackColor1,
                );
              },
            ),
          ),
        ],
      ),
    ));
  }

  SizedBox height() {
    return SizedBox(height: 18);
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
      backgroundColor: kWhiteColor,
      leading: Container(
        // color: Colors.amber,
        padding: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: CommonImageView(
          imagePath: Assets.imagesAppLogo5,
          fit: BoxFit.contain,
        ),
      ),
      actions: [
        Center(
          child: Stack(
            children: [
              RoundButton(
                  onTap: onNotificationTap,
                  color: kPrimaryColor,
                  splashRadius: 0,
                  widget: CommonImageView(
                    svgPath: Assets.imagesNotificationIcon,
                    svgColor: kSecondaryColor,
                  )),
              Positioned(
                  right: 0,
                  child: haveNotification
                      ? Icon(
                          Icons.circle,
                          size: 10,
                          color: kSecondaryColor,
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
                      filled: true,
                      readOnly: true,
                      hintText: "Search for treatment...",
                      backgroundColor: kTertiaryColor,
                      outlineBorderColor: kTransperentColor,
                      borderWidth: 5,
                      hintTextFontColor: kBlackColor1,
                      hintTextFontSize: 15,
                      prefixIconNeed: true,
                      prefixIcon: Assets.imagesSearchGreyIcon,
                      prefixIconColor: kBlackColor1.withOpacity(0.5),
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
              SizedBox(height: 26),
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

class _RatingButtons extends StatelessWidget {
  final String? buttonText;
  final Color fillColor, borderColor, textColor;
  final bool isStarVisible;
  final VoidCallback? onTap;

  const _RatingButtons({
    super.key,
    this.buttonText,
    this.fillColor = kTransperentColor,
    this.borderColor = kBlackColor1,
    this.textColor = kBlackColor1,
    this.isStarVisible = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final mW = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: mW * 0.025),
        padding: EdgeInsets.symmetric(vertical: 7, horizontal: 12),
        height: 27,
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          MyText(
            paddingRight: (isStarVisible == true) ? 5 : 0,
            text: "$buttonText",
            size: 8,
            weight: FontWeight.w500,
            color: textColor,
          ),
          (isStarVisible == true)
              ? CommonImageView(
                  svgPath: Assets.imagesStarFillIcon,
                )
              : SizedBox()
        ]),
      ),
    );
  }
}
