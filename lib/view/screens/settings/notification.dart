import 'package:flutter/material.dart';
import 'package:hospital_management/constants/app_colors.dart';
import 'package:hospital_management/constants/app_sizes.dart';
import 'package:hospital_management/view/widget/my_text_widget.dart';
import 'package:hospital_management/view/widget/sliver_app_bar_widget_first.dart';
import 'package:hospital_management/view/widget/switch_ios.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBarWidegtFirst(
            title: "Notification",
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: AppSizes.DEFAULT,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: "Common",
                    size: 15.81,
                    weight: FontWeight.w600,
                  ),
                  _NotificationTile(
                    title: "General Notification",
                    value: true,
                    onChanged: (value) {},
                  ),
                  _NotificationTile(
                    title: "Sound",
                    value: false,
                    onChanged: (value) {},
                  ),
                  _NotificationTile(
                    title: "Vibrate",
                    value: true,
                    onChanged: (value) {},
                  ),
                  MyText(
                    paddingTop: 43,
                    paddingBottom: 15,
                    text: "System & services update",
                    size: 15.81,
                    weight: FontWeight.w600,
                  ),
                  _NotificationTile(
                    title: "App updates",
                    value: true,
                    onChanged: (value) {},
                  ),
                  _NotificationTile(
                    title: "Bill Reminder",
                    value: true,
                    onChanged: (value) {},
                  ),
                  _NotificationTile(
                    title: "Promotion",
                    value: true,
                    onChanged: (value) {},
                  ),
                  _NotificationTile(
                    title: "Discount Avaiable",
                    value: false,
                    onChanged: (value) {},
                  ),
                  _NotificationTile(
                    title: "Payment Request",
                    value: false,
                    onChanged: (value) {},
                  ),
                  MyText(
                    paddingTop: 43,
                    paddingBottom: 15,
                    text: "Others",
                    size: 15.81,
                    weight: FontWeight.w600,
                  ),
                  _NotificationTile(
                    title: "New Service Available",
                    value: false,
                    onChanged: (value) {},
                  ),
                  _NotificationTile(
                    title: "New Tips Available",
                    value: true,
                    onChanged: (value) {},
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final String? title;

  final double topH;
  final Function(dynamic)? onChanged;
  final bool value;

  const _NotificationTile(
      {super.key,
      this.title,
      this.topH = 0,
      this.onChanged,
      this.value = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: topH),
      child: Row(
        children: [
          Expanded(
            child: MyText(
              text: title.toString(),
              size: 14.71,
              weight: FontWeight.w400,
              color: kBlackColor1,
            ),
          ),
          SwitchIOS(value: value, onChanged: onChanged)
        ],
      ),
    );
  }
}
