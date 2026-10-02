// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// // Note: Make sure these paths are correct in your project
// // import 'package:flutter_application_1/core/constants/color.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class AppTextField extends StatelessWidget {
//   final double? width;
//   final double? height;
//   final double? textHeight;
//   final double? textSpace;
//   final BoxConstraints? prefixConstraints;
//   final Widget? iconData;
//   final Widget? leadingIcon;
//   final String? labelText;
//   final TextStyle? labelStyle;
//   final TextStyle? style;
//   final bool readOnly;
//   final Color? borderColor;
//   final TextEditingController? controller;
//   final Function()? onTap;
//   final String? hintText;
//   final void Function(String value)? onChanged;
//   final String? Function(String?)? validator;
//   final String? initialValue;
//   final bool obscureText;
//   final FocusNode? focusNode;
//   final int? maxLength;
//   final int? maxLines;
//   final int? minLines;
//   final String? counterText;
//   final FontWeight? fontWeight;
//   final double? fontSize;
//   final TextAlignVertical? textAlignVertical;
//   final Widget? prefixIcon;
//   final Widget? surfixIcon;
//   final TextInputType? keyBoardType;
//   final bool? enabled;
//   final void Function(String)? onFieldSubmitted;
//   final EdgeInsetsGeometry? contentPadding; // Made nullable for auto-handling
//   final String obscuringCharacter;
//   final TextAlign textAlign;
//   final String? prefixText;
//   final String? surfixText;
//   final TextStyle? hintStyle;
//   final Color? bgColor;
//   final Color? textColor;
//   final Color? focusColor;
//   final Color? errorColor;
//   final TextCapitalization? textCapitalization;
//   final double borderRadius;
//   final bool? isCollapsed;
//   final bool isBorder;

//   const AppTextField({
//     super.key,
//     this.textHeight,
//     this.textAlignVertical,
//     this.textSpace,
//     this.prefixConstraints,
//     this.labelText,
//     this.isCollapsed,
//     this.width,
//     this.height = 36,
//     this.fontWeight,
//     this.iconData,
//     this.controller,
//     this.focusColor,
//     this.errorColor,
//     this.onTap,
//     this.isBorder = true,
//     this.readOnly = false,
//     this.hintText,
//     this.onChanged,
//     this.hintStyle,
//     this.bgColor = Colors.white,
//     this.prefixIcon,
//     this.surfixIcon,
//     this.leadingIcon,
//     this.textCapitalization,
//     this.initialValue,
//     this.style,
//     this.validator,
//     this.fontSize = 14,
//     this.obscureText = false,
//     this.focusNode,
//     this.keyBoardType,
//     this.enabled = true,
//     this.textAlign = TextAlign.start,
//     this.onFieldSubmitted,
//     this.maxLines = 1,
//     this.minLines = 1,
//     this.borderColor,
//     this.labelStyle,
//     this.maxLength,
//     this.prefixText,
//     this.surfixText,
//     this.counterText,
//     this.obscuringCharacter = '•',
//     this.borderRadius = 8,
//     this.contentPadding,
//     this.textColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: height?.h, // Ab ye perfect kaam karega
//       width: width ?? double.infinity,
//       child: TextFormField(
//         // FIXED: Expanded removed (It was causing the error)
//         expands: height != null
//             ? true
//             : false, // Height tabhi expand hogi jab di gayi ho
//         maxLines: height != null
//             ? null
//             : maxLines, // height fix ho toh maxLines null hona chahiye
//         minLines: height != null ? null : minLines,

//         textInputAction: TextInputAction.next,
//         textCapitalization: textCapitalization ?? TextCapitalization.none,
//         onFieldSubmitted: onFieldSubmitted,
//         inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'^\s'))],
//         enabled: enabled,
//         textAlignVertical: textAlignVertical ?? TextAlignVertical.center,
//         focusNode: focusNode,
//         initialValue: initialValue,
//         validator: validator,
//         onChanged: onChanged,
//         readOnly: readOnly,
//         obscureText: obscureText,
//         onTap: onTap,
//         textAlign: textAlign,
//         keyboardType: keyBoardType,
//         controller: controller,
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//         maxLength: maxLength,
//         cursorColor: Colors.orange, // AppColors.appColor use karein
//         style:
//             style ??
//             TextStyle(
//               height: textHeight,
//               fontSize: fontSize?.sp,
//               color: textColor ?? Colors.black,
//               fontWeight: fontWeight ?? FontWeight.w400,
//               letterSpacing: textSpace,
//             ),
//         obscuringCharacter: obscuringCharacter,
//         decoration: InputDecoration(
//           filled: true,
//           fillColor: bgColor,
//           isDense: true,
//           errorMaxLines: 1,
//           prefixIcon: prefixIcon,
//           suffixIcon: iconData,
//           prefixIconConstraints: prefixConstraints,
//           counterText: '',
//           prefix: leadingIcon,
//           suffix: surfixIcon,
//           prefixText: prefixText,
//           suffixText: surfixText,
//           hintText: hintText,
//           hintStyle:
//               hintStyle ??
//               TextStyle(fontSize: 14.sp, color: Colors.black.withOpacity(0.6)),
//           labelText: labelText == '' ? null : labelText,
//           // Fixed Padding logic
//           contentPadding:
//               contentPadding ??
//               const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
//           alignLabelWithHint: true,
//           labelStyle: labelStyle,
//           errorStyle: const TextStyle(
//             height: 0,
//             fontSize: 0,
//           ), // Hidden to keep height fixed
//           border: _border(),
//           enabledBorder: _border(),
//           focusedBorder: _border(
//             color: focusColor ?? Colors.orange,
//             width: 1.2,
//           ),
//           errorBorder: _border(color: errorColor ?? Colors.red),
//         ),
//       ),
//     );
//   }

//   OutlineInputBorder _border({Color? color, double width = 1}) {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(borderRadius.r),
//       borderSide: isBorder
//           ? BorderSide(
//               color: color ?? borderColor ?? const Color(0xFFD9D9D9),
//               width: width,
//             )
//           : BorderSide.none,
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatelessWidget {
  final double? textHeight;
  final double? textSpace;
  final double? height;
  final double? width;
  final BoxConstraints? prefixConstraints;
  final Widget? iconData;
  final Widget? leadingIcon;
  final String? labelText;
  final TextStyle? labelStyle;
  final TextStyle? style;
  final bool readOnly;
  final Color? borderColor;
  final TextEditingController? controller;
  final Function()? onTap;
  final String? hintText;
  final void Function(String value)? onChanged;
  final String? Function(String?)? validator;
  final String? initialValue;
  final bool obscureText;
  final FocusNode? focusNode;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final String? counterText;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlignVertical? textAlignVertical;
  final Widget? prefixIcon;
  final Widget? surfixIcon;
  final TextInputType? keyBoardType;
  final bool? enabled;
  final void Function(String)? onFieldSubmitted;
  final EdgeInsetsGeometry? contentPadding;
  final String obscuringCharacter;
  final TextAlign textAlign;
  final String? prefixText;
  final String? surfixText;
  final TextStyle? hintStyle;
  final Color? textColor;
  final Color? bgColor;
  final Color? focusColor;
  final Color? errorColor;
  final TextCapitalization? textCapitalization;
  final double borderRadius;
  final bool? isCollapsed;
  final bool isBorder;

  const AppTextField({
    super.key,
    this.height,
    this.width,
    this.textHeight,
    this.textAlignVertical,
    this.textSpace,
    this.prefixConstraints,
    this.labelText,
    this.isCollapsed,
    this.fontWeight,
    this.iconData,
    this.controller,
    this.focusColor,
    this.errorColor,
    this.onTap,
    this.isBorder = true,
    this.readOnly = false,
    this.hintText,
    this.onChanged,
    this.hintStyle,
    this.bgColor = Colors.white,
    this.prefixIcon,
    this.surfixIcon,
    this.leadingIcon,
    this.textCapitalization,
    this.initialValue,
    this.style,
    this.validator,
    this.fontSize = 14,
    this.obscureText = false,
    this.focusNode,
    this.keyBoardType,
    this.enabled = true,
    this.textAlign = TextAlign.start,
    this.onFieldSubmitted,
    this.maxLines = 1,
    this.minLines = 1,
    this.borderColor,
    this.labelStyle,
    this.maxLength,
    this.prefixText,
    this.surfixText,
    this.counterText,
    this.obscuringCharacter = '•',
    this.borderRadius = 8,
    this.contentPadding,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,

      minLines: minLines,
      textInputAction: TextInputAction.next,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'^\s'))],
      enabled: enabled,
      textAlignVertical: textAlignVertical ?? TextAlignVertical.center,
      focusNode: focusNode,
      initialValue: initialValue,
      validator: validator,
      onChanged: onChanged,
      readOnly: readOnly,
      obscureText: obscureText,
      onTap: onTap,
      textAlign: textAlign,
      keyboardType: keyBoardType,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLength: maxLength,
      cursorColor: Colors.blue,
      style:
          style ??
          TextStyle(
            height: textHeight,
            fontSize: fontSize?.sp,
            color: textColor ?? Colors.black,
            fontWeight: fontWeight ?? FontWeight.w400,
            letterSpacing: textSpace,
          ),
      obscuringCharacter: obscuringCharacter,
      decoration: InputDecoration(
        filled: true,
        fillColor: bgColor,
        isDense: true,
        errorMaxLines: 1,
        prefixIcon: prefixIcon,
        suffixIcon: iconData,
        prefixIconConstraints: prefixConstraints,
        counterText: '',
        prefix: leadingIcon,
        suffix: surfixIcon,
        prefixText: prefixText,
        suffixText: surfixText,
        hintText: hintText,
        hintStyle:
            hintStyle ??
            TextStyle(fontSize: 14.sp, color: Colors.black.withOpacity(0.6)),
        labelText: labelText == '' ? null : labelText,
        contentPadding:
            contentPadding ??
            EdgeInsets.only(
              left: 12.w,
              right: 12.w,
              top: 10.h, // 👈 yahi main cheez hai
              bottom: 10.h,
            ),
        alignLabelWithHint: true,
        labelStyle: labelStyle,
        errorStyle: const TextStyle(height: 0, fontSize: 0),
        border: _border(),
        enabledBorder: _border(),
        focusedBorder: _border(color: focusColor ?? Colors.blue, width: 1.2),
        errorBorder: _border(color: errorColor ?? Colors.red),
      ),
    );
  }

  OutlineInputBorder _border({Color? color, double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius.r),
      borderSide: isBorder
          ? BorderSide(color: color ?? borderColor ?? Colors.blue, width: width)
          : BorderSide.none,
    );
  }
}
