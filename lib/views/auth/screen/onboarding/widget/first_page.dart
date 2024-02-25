import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spendly/utils/colors/app_theme.dart';






class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/savings.svg',
            //height: 400,
            //width: 450,
          ),
          SizedBox(height: 60.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              'Save money in naira and usd seamlessly \n  with awesome interests and best rates',
              style: GoogleFonts.inter(
                color: AppColor.darkGreyColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600
              ),
            ),
          ),        
        ],
      ),
    );
  }
}