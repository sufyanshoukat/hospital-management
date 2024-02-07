import 'package:flutter/material.dart';
import 'package:hospital_management/constants/app_colors.dart';
import 'package:hospital_management/constants/app_images.dart';
import 'package:hospital_management/constants/app_sizes.dart';
import 'package:hospital_management/view/widget/custom_textfield.dart';
import 'package:hospital_management/view/widget/filter_btn.dart';
import 'package:hospital_management/view/widget/simple_app_bar.dart';
import 'package:hospital_management/view/widget/treatment_btn.dart';

class DepartmentSearch extends StatefulWidget {
  const DepartmentSearch({super.key});

  @override
  State<DepartmentSearch> createState() => _DepartmentSearchState();
}

class _DepartmentSearchState extends State<DepartmentSearch> {
  // Icons List
  List<String> icons = [
    Assets.imagesCardiologyIcon,
    Assets.imagesLungsIcon,
    Assets.imagesBrainIcon,
    Assets.imagesPediatricsIcon,
    Assets.imagesSurgeryIcon,
    Assets.imagesOncologyIcon,
    Assets.imagesRadiologyIcon,
    Assets.imagesPharmacyIcon,
    Assets.imagesPsychiatryIcon,
    Assets.imagesPatientRelationsIcon
  ];

  List<String> title = [
    "Cardiology",
    "Respiratory",
    "Neurology",
    "Pediatrics",
    "Surgery",
    "Oncology",
    "Radiology",
    "Pharmacy",
    "Psychiatry",
    "Patient"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: simpleAppBar(title: "Departments"),
      body: Padding(
        padding: AppSizes.DEFAULT,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: "Search for treatment...",
                    backgroundColor: kWhiteColor,
                    outlineBorderColor: kTransperentColor,
                    borderWidth: 5,
                    hintTextFontColor: kBlackColor50Percent,
                    hintTextFontSize: 15,
                    prefixIconNeed: true,
                    prefixIcon: Assets.imagesSearchGreyIconPng,
                    prefixIconColor: kBlackColor50Percent,
                  ),
                ),
                SizedBox(width: 10),
                FilterBtn(onTap: () {})
              ],
            ),
            SizedBox(height: 40),
            Expanded(
              //  color: Colors.amber,
              child: GridView.builder(
                padding: EdgeInsets.all(0),
                itemCount: 10,
                shrinkWrap: true,
                // scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 0,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DepartmentButton(
                        onTap: () {},
                        svgIcon: icons[index],
                        title: title[index],
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
