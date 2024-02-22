import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendly/utils/colors/app_theme.dart';



class CustomAppBarTitle extends StatelessWidget {
  CustomAppBarTitle({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        color: AppColor.blackColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500
      ),
    );
  }
}