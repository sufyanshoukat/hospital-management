import 'package:flutter/material.dart';
import 'package:hospital_management/constants/app_images.dart';
import 'package:hospital_management/constants/app_sizes.dart';
import 'package:hospital_management/view/screens/auth/login/login.dart';
import 'package:hospital_management/view/widget/sliver_app_bar_widget_first.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBarWidegtFirst(
            title: "Edit Profile",
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: AppSizes.HORIZONTAL,
              child: Column(
                children: [
                  SizedBox(height: 29),
                  TextFieldWithSuffixIcon(
                    hint: "Full name",
                    suffixIcon: Assets.imagesPersonNameIcon,
                    suffixIconHeight: 16,
                  ),
                  sH(),

                  TextFieldWithSuffixIcon(
                    hint: "Valid email",
                    suffixIcon: Assets.imagesEmailIcon,
                    suffixIconHeight: 16,
                  ),
                  sH(),

                  // Password Field
                  TextFieldWithSuffixIcon(
                    hint: "Phone number",
                    suffixIcon: Assets.imagesPhoneNumberIcon,
                  ),
                  sH(),
                  TextFieldWithSuffixIcon(
                    hint: "Strong Password",
                    suffixIcon: Assets.imagesLockIcon,
                  ),
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
