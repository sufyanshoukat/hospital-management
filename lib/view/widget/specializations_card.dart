import 'package:flutter/material.dart';
import 'package:hospital_management/constants/app_colors.dart';
import 'package:hospital_management/view/widget/my_text_widget.dart';

class SpecializationCard extends StatelessWidget {
  final String? specialization;
  const SpecializationCard({super.key, this.specialization});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      height: 23,
      decoration: BoxDecoration(
          color: kTertiaryColor, borderRadius: BorderRadius.circular(79)),
      child: Center(
        child: MyText(
          text: specialization ?? "spec",
          color: kSecondaryColor,
          size: 9,
          weight: FontWeight.w500,
        ),
      ),
    );
  }
}
