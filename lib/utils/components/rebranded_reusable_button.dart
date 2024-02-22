import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';





class RebrandedReusableButton extends StatelessWidget {
  const RebrandedReusableButton({super.key, required this.color, required this.text, required this.onPressed, required this.textColor});
  final Color color;
  final Color textColor;
  final String text;
  final VoidCallback onPressed;

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
          color: color,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: color
          )
        ),
        child: Text(
          text,
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: textColor,
              fontSize: 17.sp,
              fontWeight: FontWeight.w500
            )
          )
        ),
      )
    );
  }
}