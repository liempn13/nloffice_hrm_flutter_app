import 'package:flutter/material.dart';
import 'package:nloffice_hrm/constant/app_color.dart';
import 'package:velocity_x/velocity_x.dart';

class InputStyles {
  //get the border for the textform field
  static InputBorder inputEnabledBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
          // color: AppColor.cancelledColor,
          //AppColor.primaryColor,
          ),
      borderRadius: BorderRadius.circular(Vx.dp8),
    );
  }

  //get the border for the textform field
  static InputBorder inputFocusBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(
          // color: AppColor.cancelledColor,
          //AppColor.primaryColorDark,
          ),
      borderRadius: BorderRadius.circular(Vx.dp8),
    );
  }

  //
  //get the border for the textform field
  static InputBorder inputUnderlineEnabledBorder() {
    return UnderlineInputBorder(
      borderSide: BorderSide(
          // color: AppColor.cancelledColor,
          ),
      borderRadius: BorderRadius.circular(Vx.dp8),
    );
  }

  //get the border for the textform field
  static InputBorder inputUnderlineFocusBorder() {
    return UnderlineInputBorder(
      borderSide: BorderSide(
          // color: AppColor.cancelledColor,
          ),
      borderRadius: BorderRadius.circular(Vx.dp8),
    );
  }
}
