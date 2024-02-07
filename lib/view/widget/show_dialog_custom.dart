import 'package:flutter/material.dart';
import 'package:hospital_management/constants/app_colors.dart';

Future<dynamic> showDialogCustom({
  required BuildContext context,
  required Widget widget,
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
            backgroundColor: kWhiteColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            titlePadding: EdgeInsets.symmetric(horizontal: 30, vertical: 29),
            title: widget);
      });
}
