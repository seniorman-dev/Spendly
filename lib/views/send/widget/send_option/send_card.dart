import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendly/utils/colors/app_theme.dart';





class SendCard extends StatelessWidget {
  const SendCard({super.key, required this.onTap, required this.icon, required this.title, required this.subtitle});
  final VoidCallback onTap;
  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.center,
              height: 40.h,
              width: 40.w,
              //padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
              decoration: BoxDecoration(
                color: AppColor.mainColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                icon,
                color: AppColor.blackColor,
                size: 24.r,
              ),
            ),
            SizedBox(width: 15.w,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      color: AppColor.blackColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Text(
                    subtitle,
                    style: GoogleFonts.inter(
                      color: AppColor.darkGreyColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                 
      
                ],
              ),
            ),
            SizedBox(width: 15.w,),
            Icon(
              CupertinoIcons.chevron_right,
              color: AppColor.blackColor,
              size: 24.r,
            ),
          ],
        ),
      ),
    );
  }
}