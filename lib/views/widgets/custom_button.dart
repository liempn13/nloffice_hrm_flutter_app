import 'package:flutter/material.dart';
import 'package:nloffice_hrm/constant/app_colors.dart';
import 'package:nloffice_hrm/constant/app_text_styles.dart';
import 'package:nloffice_hrm/views/widgets/ui_spacer.dart';
// import 'package:sod_user/utils/utils.dart';
import 'package:nloffice_hrm/views/widgets/busy_indicator.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final double? iconSize;
  final Widget? child;
  final TextStyle? titleStyle;
  final Function? onPressed;
  final OutlinedBorder? shape;
  final bool isFixedHeight;
  final double? height;
  final bool loading;
  final double? shapeRadius;
  final Color? color;
  final Color? iconColor;
  final double? elevation;
  final EdgeInsetsGeometry? padding;

  const CustomButton({
    this.title,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.child,
    this.onPressed,
    this.shape,
    this.isFixedHeight = false,
    this.height,
    this.loading = false,
    this.shapeRadius = Vx.dp4,
    this.color,
    this.titleStyle,
    this.elevation,
    this.padding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      padding: EdgeInsets.all(0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: this.padding,
          elevation: this.elevation,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: this.color ?? AppColor.primaryColor,
          disabledBackgroundColor: this.loading
              ? this.color == null
                  ? AppColor.primaryColor
                  : this.color
              : null,
          shape: this.shape ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
        ),
        // onPressed: (this.loading || this.onPressed == null)
        //     ? null
        //     : () {
        //         //remove focus from any input field
        //         FocusScope.of(context).unfocus();
        //         this.onPressed!();
        //       },
        onPressed: (this.loading || this.onPressed == null)
            ? null
            : () {
                //change focus to new focus node
                FocusScope.of(context).requestFocus(new FocusNode());
                this.onPressed!();
              },
        child: this.loading
            ? BusyIndicator(color: Colors.white)
            : Container(
                padding: this.padding,
                width: null, //double.infinity,
                height: this.isFixedHeight ? Vx.dp48 : (this.height ?? Vx.dp48),
                child: this.child ??
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        this.icon != null
                            ? Icon(
                                this.icon,
                                color: this.iconColor ?? Colors.white,
                                size: this.iconSize ?? 20,
                                textDirection:
                                    translator.activeLocale.languageCode == "ar"
                                        ? TextDirection.rtl
                                        : TextDirection.ltr,
                              ).pOnly(
                                right:
                                    translator.activeLocale.languageCode == "ar"
                                        ? Vx.dp0
                                        : Vx.dp5,
                                left:
                                    translator.activeLocale.languageCode != "ar"
                                        ? Vx.dp0
                                        : Vx.dp5,
                              )
                            : UiSpacer.emptySpace(),
                        this.title.isNotEmptyAndNotNull
                            ? Text(
                                "${this.title}",
                                textAlign: TextAlign.center,
                                style: this.titleStyle ??
                                    AppTextStyle.h4TitleTextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                    ),
                              ).centered()
                            : UiSpacer.emptySpace(),
                      ],
                    ),
              ),
      ),
    );
  }
}
