import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendly/utils/colors/app_theme.dart';



class QuickAction extends StatelessWidget {
  const QuickAction({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //1
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  //height: 50.h,
                  width: 90.w,
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                  decoration: BoxDecoration(
                    color: AppColor.lightNormalGreen.withOpacity(0.2),
                    borderRadius: BorderRadiusDirectional.circular(10.r)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.phone_fill,
                        color: AppColor.normalGreen,
                        size: 24.r,
                      ),
                      SizedBox(height: 5.h,),
                      Text(
                        'Airtime',
                        style: GoogleFonts.inter(
                          color: AppColor.blackColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              //2
              SizedBox(width: 10.w,),
              //3
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  //height: 50.h,
                  width: 90.w,
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                  decoration: BoxDecoration(
                    color: AppColor.lightNormalAmber.withOpacity(0.2),
                    borderRadius: BorderRadiusDirectional.circular(10.r)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.antenna_radiowaves_left_right,
                        color: AppColor.normalAmber,
                        size: 24.r,
                      ),
                      SizedBox(height: 5.h,),
                      Text(
                        'Data',
                        style: GoogleFonts.inter(
                          color: AppColor.blackColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10.w,),
              //3
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  //height: 50.h,
                  width: 90.w,
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                  decoration: BoxDecoration(
                    color: AppColor.lightNormalBlue.withOpacity(0.2),
                    borderRadius: BorderRadiusDirectional.circular(10.r)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.layers_fill,
                        color: AppColor.normalBlue,
                        size: 24.r,
                      ),
                      SizedBox(height: 5.h,),
                      Text(
                        'Bills',
                        style: GoogleFonts.inter(
                          color: AppColor.blackColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              //4
              SizedBox(width: 10.w,),
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  //height: 50.h,
                  width: 90.w,
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                  decoration: BoxDecoration(
                    color: AppColor.lightNormalPurple.withOpacity(0.2),
                    borderRadius: BorderRadiusDirectional.circular(10.r)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.bitcoin_circle,
                        color: AppColor.normalPurple,
                        size: 24.r,
                      ),
                      SizedBox(height: 5.h,),
                      Text(
                        'Crypto',
                        style: GoogleFonts.inter(
                          color: AppColor.blackColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}