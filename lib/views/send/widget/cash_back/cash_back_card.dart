import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendly/utils/colors/app_theme.dart';




class CashbackCard extends StatelessWidget {
  const CashbackCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Container(
        alignment: Alignment.center,
        //height: 55.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: AppColor.mainColor.withOpacity(0.1), //Colors.transparent,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  //color: AppColor.mainColor,
                  color: AppColor.blackColor,
                  CupertinoIcons.chevron_right_2,
                  size: 30.r,
                ),
                SizedBox(width: 10.w,),
                Text(
                  'Cashback Balance',
                  style: GoogleFonts.inter(
                    //color: AppColor.blackColor,
                    color: AppColor.darkGreyColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ],
            ),
            /*SizedBox(height: 10.h,),
            Text(
              'you get up to N100 reward on every bill payment from N1000 and above',
              style: GoogleFonts.inter(
                color: AppColor.darkGreyColor, //.withOpacity(0.2),
                fontSize: 13.sp,
                fontWeight: FontWeight.w400
              ),
            ),*/
            SizedBox(height: 10.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'N4300.00',
                    style: GoogleFonts.atma(
                      color: AppColor.blackColor,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: 10.w,),
                InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 40.h,
                    width: 80.w,
                    //padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                    decoration: BoxDecoration(
                      color: AppColor.lightNormalBlue.withOpacity(0.2), //Colors.transparent,
                      //border: Border.all(color: AppColor.bgColor),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(
                      'Use fund',
                      style: GoogleFonts.inter(
                        color: AppColor.blackColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                ),            
              ],
            ),
          ],
        )
          
        
      ),
    );
  }
}