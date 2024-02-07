import 'package:flutter/cupertino.dart';
import 'package:hospital_management/constants/app_colors.dart';

class SwitchIOS extends StatelessWidget {
  final Function(dynamic)? onChanged;
  final bool value;
  final Alignment alignment;
  const SwitchIOS(
      {super.key,
      required this.onChanged,
      this.value = true,
      this.alignment = Alignment.centerRight});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      alignment: alignment,
      scale: .7,
      child: CupertinoSwitch(
          activeColor: kSecondaryColor,
          trackColor: kTertiaryColor,
          thumbColor: value ? kWhiteColor : kSecondaryColor,
          value: value,
          onChanged: onChanged),
    );
  }
}
