import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital_management/constants/app_colors.dart';
import 'package:hospital_management/constants/app_images.dart';
import 'package:hospital_management/view/screens/home/home.dart';
import 'package:hospital_management/view/screens/settings/setting.dart';
import 'package:hospital_management/view/widget/common_image_view_widget.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: CommonImageView(
          imagePath: Assets.imagesBNHomeFill,
        ),
        inactiveIcon: CommonImageView(
          imagePath: Assets.imagesBNHomeOutline,
        ),
        //Icon(CupertinoIcons.home),
        title: "Home",
        activeColorPrimary: kSecondaryColor,
        inactiveColorPrimary: kBlackColor50Percent,
      ),
      PersistentBottomNavBarItem(
        icon: CommonImageView(
          imagePath: Assets.imagesBNPersonFill,
        ),
        inactiveIcon: CommonImageView(
          imagePath: Assets.imagesBNPersonOutline,
        ),
        title: "Settings",
        activeColorPrimary: kSecondaryColor,
        inactiveColorPrimary: kBlackColor50Percent,
      ),
    ];
  }

  List<Widget> _buildScreens() {
    return [
      Home(),
      Setting(),
    ];
  }

  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      decoration: NavBarDecoration(
        colorBehindNavBar: kPrimaryColor,
      ),
      //popAllScreensOnTapOfSelectedTab: false,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style3,
    );
  }
}
