import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myerp/theme/app.colors.dart';

class AppText extends StatelessWidget {
  final String title;
  final double fontSize;
  final double? letterSpacing;
  final FontWeight fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final TextDecoration? textDecoration;
  final FontStyle? fontStyle;
  final int? maxLine;
  final double? height;
  final double? textScaling;

  const AppText({
    super.key,
    required this.title,
    this.color,
    this.textScaling = 1.0,
    this.height,
    this.maxLine,
    this.letterSpacing,
    this.textAlign,
    this.textOverflow,
    this.textDecoration,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign ?? TextAlign.start,
      textScaleFactor: textScaling,
      maxLines: maxLine,
      overflow: textOverflow,
      style: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontSize: fontSize.sp,
        height: height != null ? height!.h / fontSize.sp : null,
        letterSpacing: (letterSpacing ?? 0).w,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        color: color ?? AppColors.textColor,
        decoration: textDecoration,
      ),
    );
  }
}

class ReqAppText extends StatelessWidget {
  final String? title;
  final String? title2;
  final String? title3;
  final String? title4;

  final double? fontSize;
  final double? fontSize2;
  final double? fontSize3;
  final double? fontSize4;

  final double? height1;
  final double? height2;
  final double? height3;
  final double? height4;

  final double? letterSpacing1;
  final double? letterSpacing2;
  final double? letterSpacing3;
  final double? letterSpacing4;

  final FontWeight fontWeight1;
  final FontWeight? fontWeight2;
  final FontWeight? fontWeight3;
  final FontWeight? fontWeight4;

  final FontStyle? fontStyle1;
  final FontStyle? fontStyle2;
  final FontStyle? fontStyle3;
  final FontStyle? fontStyle4;

  final String? fontFamily;

  final Color? color1;
  final Color? color2;
  final Color? color3;
  final Color? color4;

  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final TextDecoration? textDecoration;

  const ReqAppText({
    super.key,
    required this.title,
    this.title2,
    this.title3,
    this.title4,
    this.fontSize = 14,
    this.fontSize2 = 14,
    this.fontSize3 = 14,
    this.fontSize4 = 14,
    this.height1,
    this.height2,
    this.height3,
    this.height4,
    this.letterSpacing1,
    this.letterSpacing2,
    this.letterSpacing3,
    this.letterSpacing4,
    this.fontWeight1 = FontWeight.w400,
    this.fontWeight2,
    this.fontWeight3,
    this.fontWeight4,
    this.fontStyle1,
    this.fontStyle2,
    this.fontStyle3,
    this.fontStyle4,
    this.fontFamily = 'Plus Jakarta Sans',
    this.color1,
    this.color2,
    this.color3,
    this.color4,
    this.textAlign,
    this.textOverflow,
    this.textDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.center,
      overflow: textOverflow ?? TextOverflow.visible,
      text: TextSpan(
        text: title ?? '',
        style: TextStyle(
          color: color1 ?? AppColors.textColor,
          fontSize: fontSize!.sp,
          fontFamily: fontFamily,
          fontWeight: fontWeight1,
          fontStyle: fontStyle1 ?? FontStyle.normal,
          height: height1 != null ? height1!.h / fontSize!.sp : null,
          letterSpacing: letterSpacing1 != null ? letterSpacing1!.w : 0,
          decoration: textDecoration,
        ),
        children: [
          if (title2 != null)
            TextSpan(
              text: title2,
              style: TextStyle(
                fontSize: fontSize2!.sp,
                fontWeight: fontWeight2 ?? FontWeight.w400,
                fontStyle: fontStyle2 ?? FontStyle.normal,
                color: color2 ?? AppColors.textLightColor,
                fontFamily: fontFamily,
                height: height2 != null ? height2!.h / fontSize2!.sp : null,
                letterSpacing: letterSpacing2 != null ? letterSpacing2!.w : 0,
              ),
            ),
          if (title3 != null)
            TextSpan(
              text: title3,
              style: TextStyle(
                fontSize: fontSize3!.sp,
                fontWeight: fontWeight3 ?? FontWeight.w400,
                fontStyle: fontStyle3 ?? FontStyle.normal,
                color: color3 ?? AppColors.textLightColor,
                fontFamily: fontFamily,
                height: height3 != null ? height3!.h / fontSize3!.sp : null,
                letterSpacing: letterSpacing3 != null ? letterSpacing3!.w : 0,
              ),
            ),
          if (title4 != null)
            TextSpan(
              text: title4,
              style: TextStyle(
                fontSize: fontSize4!.sp,
                fontWeight: fontWeight4 ?? FontWeight.w400,
                fontStyle: fontStyle4 ?? FontStyle.normal,
                color: color4 ?? AppColors.textLightColor,
                fontFamily: fontFamily,
                height: height4 != null ? height4!.h / fontSize4!.sp : null,
                letterSpacing: letterSpacing4 != null ? letterSpacing4!.w : 0,
              ),
            ),
        ],
      ),
    );
  }
}
