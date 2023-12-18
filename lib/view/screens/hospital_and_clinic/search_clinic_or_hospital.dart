import 'package:flutter/material.dart';
import 'package:hospital_management/constants/app_colors.dart';
import 'package:hospital_management/constants/app_images.dart';
import 'package:hospital_management/view/screens/auth/login/login.dart';
import 'package:hospital_management/view/widget/back_btn_with_arrow.dart';

class SearchClinicORHospitals extends StatefulWidget {
  const SearchClinicORHospitals({super.key});

  @override
  State<SearchClinicORHospitals> createState() =>
      _SearchClinicORHospitalsState();
}

class _SearchClinicORHospitalsState extends State<SearchClinicORHospitals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200,
        automaticallyImplyLeading: false,
        backgroundColor: kSecondaryColor,
        actions: [
          Container(
            color: Colors.amber,
            child: Row(
              children: [
                SizedBox(width: 20),
                BackBtnWithArrow(),
                SizedBox(height: 20),
                // Expanded(
                //   child: TextFieldWithSuffixIcon(
                //     hint: "Search Clinic/Hospital",
                //     suffixIcon: Assets.imagesCloseSearchIcon,
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
