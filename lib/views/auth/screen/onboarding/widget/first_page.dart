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
            height: 330.h,
            //width: 450.w,
          ),
          SizedBox(height: 30.h,),
          Text(
            "Save money in Naira and \$USD seamlessly \n  with awesome interests and best rates",
            style: GoogleFonts.inter(
              color: AppColor.darkGreyColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(height: 20.h,),
          Text(
            'fctyyfyjyujyukgkjghhgjtfgghghjghjgfhjhgjfhgjxsdgsd\n                             fhgdfhjfgjgjh',
            style: GoogleFonts.inter(
              color: Colors.grey,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400
            ),
          ),

        ],
      ),
    );
  }
}
