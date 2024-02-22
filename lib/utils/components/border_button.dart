import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendly/utils/colors/app_theme.dart';





class BorderButton extends StatelessWidget {
  const BorderButton({super.key, required this.onPressed, required this.text, required this.textColor});
  final VoidCallback onPressed;
  final Color textColor;
  final String text;
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        alignment: Alignment.center,
        height: 50.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.bgColor,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: textColor,
            width: 2.0,
          )
        ),
        child: Text(
          text,
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: textColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600
            )
          )
        ),
      )
    );
  }
}