import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendly/utils/colors/app_theme.dart';





class BeneficiaryDisplay extends StatelessWidget {
  const BeneficiaryDisplay({super.key, required this.name, required this.onTap});
  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           CircleAvatar(
            backgroundColor: AppColor.greyColor,
            radius: 30.r,
            //backgroundImage:
          ),
          SizedBox(
            height: 5.w,
          ),
          Text(
            name,
            style: GoogleFonts.inter(
              color: AppColor.darkGreyColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400
            ),
          )
        ],
      ),
    );
  }
}