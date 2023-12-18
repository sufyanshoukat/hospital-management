import 'package:flutter/material.dart';
import 'package:hospital_management/constants/app_colors.dart';
import 'package:hospital_management/constants/app_fonts.dart';
import 'package:hospital_management/view/widget/common_image_view_widget.dart';
import 'package:hospital_management/view/widget/my_text_widget.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  TextEditingController? controller = TextEditingController();
  final double radius;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final Color suffixIconColor;
  final Color focusedBorderColor;
  final double focusedBorderWidth;
  final Color outlineBorderColor;
  final double outlineBorderWidth;
  final String hintText;
  final double hintTextFontSize;
  final Color hintTextFontColor;
  final bool filled;
  final Color backgroundColor;
  final double contentPaddingLeft;
  final double contentPaddingRight;
  final double contentPaddingBottom;
  final double contentPaddingTop;
  final double left;
  final double right;
  final double top;
  final double bottom;
  final String suffixIcon;
  final bool suffixIconNeed;
  final bool obscureText;
  final double iconScale;
  final double? suffixIconHeight;
  final bool prefixIconNeed;
  final String prefixIcon;
  final Color prefixIconColor;
  final String? labelText;
  final bool isUseLebelText;
  final Color lableColor;
  final Color txtColor;
  final bool enabled;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onSuffixTap;
  final VoidCallback? onTextFieldTap;
  final bool textFieldEnable , readOnly;

  //final bool needSvgInPrefix;

  CustomTextField({
    super.key,
    this.controller,
    this.radius = 10,
    this.enabled = true,
    this.onChanged,
    this.onSuffixTap,
    this.borderRadius = 0,
    this.borderColor = kTransperentColor,
    this.borderWidth = 0,
    this.focusedBorderColor = kSecondaryColor,
    this.focusedBorderWidth = 1,
    this.outlineBorderColor = kTertiaryColor,
    this.outlineBorderWidth = 1,
    this.hintText = 'Hint here',
    this.hintTextFontColor = kBlackColor1,
    this.hintTextFontSize = 14,
    this.filled = true,
    this.backgroundColor = kPrimaryColor,
    this.contentPaddingLeft = 22,
    this.contentPaddingRight = 0,
    this.contentPaddingBottom = 0,
    this.contentPaddingTop = 0,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
    this.suffixIcon = '',
    this.suffixIconNeed = false,
    this.obscureText = false,
    this.iconScale = 4,
    this.suffixIconHeight,
    this.suffixIconColor = kTransperentColor, //kPrimaryColor,
    this.prefixIconNeed = false,
    this.prefixIcon = '',
    this.prefixIconColor = kPrimaryColor,
    this.labelText,
    this.isUseLebelText = false,
    this.lableColor = kPrimaryColor,
    this.txtColor = kBlackColor1,
    this.onTextFieldTap,
    this.textFieldEnable = true,
    this.readOnly = true,
    //this.needSvgInPrefix = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: left, right: right, top: top, bottom: bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (isUseLebelText == true)
              ? MyText(
                  paddingBottom: 7,
                  text: labelText ?? "lebel Text Here",
                  size: 14,
                  weight: FontWeight.w400,
                  color: lableColor,
                )
              : SizedBox(),
          TextFormField(
            readOnly: readOnly,
            enableInteractiveSelection: textFieldEnable,
            onTap: onTextFieldTap,
            cursorColor: kSecondaryColor,
            enabled: enabled,
            onChanged: onChanged,
            style: TextStyle(color: txtColor),
            decoration: InputDecoration(
              prefixIcon: (prefixIconNeed == false)
                  ? null
                  : Image.asset(prefixIcon,
                      scale: iconScale, color: prefixIconColor),
              suffixIcon: (suffixIconNeed == false)
                  ? null
                  : GestureDetector(
                      onTap: onSuffixTap,
                      child: Container(
                        height: 30,
                        width: 30,
                        // color: Colors.amber,
                        child: Center(
                          child: CommonImageView(
                            imagePath: suffixIcon,
                            height: suffixIconHeight ?? 20,
                          ),
                        ),
                      )),
              filled: filled,
              fillColor: backgroundColor,
              hintText: hintText,
              hintStyle: TextStyle(
                  color: hintTextFontColor.withOpacity(0.5),
                  fontSize: hintTextFontSize,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFonts.Poppins),
              border: outlineInputBorderDecoration(
                  r: borderRadius, borderClr: borderColor, width: borderRadius),
              focusedBorder: outlineInputBorderDecoration(
                  r: radius,
                  borderClr: focusedBorderColor,
                  width: focusedBorderWidth),
              enabledBorder: outlineInputBorderDecoration(
                  r: radius,
                  borderClr: outlineBorderColor,
                  width: outlineBorderWidth),
              disabledBorder: outlineInputBorderDecoration(
                  r: radius,
                  borderClr: outlineBorderColor,
                  width: outlineBorderWidth),
              contentPadding: EdgeInsets.only(
                  left: contentPaddingLeft,
                  bottom: contentPaddingBottom,
                  top: contentPaddingTop,
                  right: contentPaddingRight),
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder outlineInputBorderDecoration(
      {double? r, Color? borderClr, double? width}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(r!),
      borderSide: BorderSide(color: borderClr!, width: width!),
    );
  }
}
