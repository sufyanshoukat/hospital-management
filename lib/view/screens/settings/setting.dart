import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_management/constants/app_colors.dart';
import 'package:hospital_management/constants/app_images.dart';
import 'package:hospital_management/constants/app_sizes.dart';
import 'package:hospital_management/constants/app_styling.dart';
import 'package:hospital_management/view/screens/settings/edit_profile.dart';
import 'package:hospital_management/view/screens/settings/favorite.dart';
import 'package:hospital_management/view/screens/settings/history.dart';
import 'package:hospital_management/view/screens/settings/notification.dart';
import 'package:hospital_management/view/screens/settings/privacy_policy.dart';
import 'package:hospital_management/view/widget/common_image_view_widget.dart';
import 'package:hospital_management/view/widget/my_text_widget.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool isLanguageEng = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            children: [
              CommonImageView(
                imagePath: Assets.imagesProfileImg,
                radius: 150,
                height: 117,
                width: 117,
              ),
              MyText(
                text: "Puerto Rico",
                weight: FontWeight.w500,
                size: 21.55,
              ),
              MyText(
                text: "youremail@domain.com | +01 234 567 89",
                weight: FontWeight.w400,
                size: 13.71,
                color: kBlackColor50Percent,
              ),
              Container(
                margin: EdgeInsets.only(top: 24),
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                decoration: AppStyling().settingCardDecoration(),
                child: Column(
                  children: [
                    _SettingTile(
                      onTap: () {
                        Get.to(() => EditProfile());
                      },
                      topH: 0,
                      title: "Edit Profile",
                      svgIcon: Assets.imagesEditProfileIcon,
                    ),
                    _SettingTile(
                      onTap: () {
                        Get.to(() => NotificationPage());
                      },
                      title: "Notifications",
                      svgIcon: Assets.imagesSettingNotificationIcon,
                    ),
                    _SettingTile(
                        onTap: () {
                          isLanguageEng == true
                              ? isLanguageEng = false
                              : isLanguageEng = true;
                          setState(() {});
                        },
                        title: "Language",
                        svgIcon: Assets.imagesLanguageIcon,
                        haveAction: false,
                        widget: CommonImageView(
                          svgPath: isLanguageEng
                              ? Assets.imagesEngToArbIcon
                              : Assets.imagesArbToEngIcon,
                          svgColor: kBlackColor1.withOpacity(0.5),
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 17, bottom: 17),
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
                decoration: AppStyling().settingCardDecoration(),
                child: Column(
                  children: [
                    _SettingTile(
                      onTap: () {
                        Get.to(() => Favorite());
                      },
                      topH: 0,
                      title: "Favorites",
                      svgIcon: Assets.imagesStarOutlineIcon,
                    ),
                    _SettingTile(
                      onTap: () {
                        Get.to(() => History());
                      },
                      title: "History",
                      svgIcon: Assets.imagesHistoryIcon,
                    ),
                    _SettingTile(
                      onTap: () {
                        Get.to(() => PrivacyPolicy());
                      },
                      title: "Privacy policy",
                      svgIcon: Assets.imagesPrivacyPolicyIcon,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CommonImageView(
                      svgPath: Assets.imagesLogoutIcon,
                    ),
                    MyText(
                      paddingLeft: 10,
                      text: "Log out",
                      size: 14.71,
                      weight: FontWeight.w500,
                      color: kRedColor,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingTile extends StatelessWidget {
  final String? title, svgIcon;
  final VoidCallback? onTap;
  final Widget? widget;
  final bool haveAction;
  final double topH;

  const _SettingTile(
      {super.key,
      this.title,
      this.svgIcon,
      this.onTap,
      this.haveAction = true,
      this.widget,
      this.topH = 20});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: topH),
        child: Row(
          children: [
            CommonImageView(
              svgPath: svgIcon,
              svgColor: kBlackColor1.withOpacity(0.5),
            ),
            SizedBox(width: 13),
            Expanded(
              child: MyText(
                text: title.toString(),
                size: 14.71,
                weight: FontWeight.w400,
                color: kBlackColor1.withOpacity(0.5),
              ),
            ),
            haveAction
                ? Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: kBlackColor1.withOpacity(0.5),
                    size: 13,
                  )
                : Container(
                    child: widget,
                  )
          ],
        ),
      ),
    );
  }
}
