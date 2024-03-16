import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendly/utils/colors/app_theme.dart';





class InvestmentCard extends StatelessWidget {
  const InvestmentCard({super.key, required this.title, required this.sub_title, required this.onTap, required this.icon});
  final String title;
  final String sub_title;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          //height: 55.h,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          decoration: BoxDecoration(
            //color: AppColor.mainColor.withOpacity(0.1),
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: AppColor.emptyPicColor.withOpacity(0.5),
                blurRadius: 0.2,
                spreadRadius: 0.2
              )
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: AppColor.mainColor,
                size: 30.r,
              ),
              SizedBox(width: 10.w,),
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
                      overflow: TextOverflow.visible,
                    ),

                    SizedBox(height: 5.h,),

                    Text(
                      sub_title,
                      style: GoogleFonts.inter(
                        color: AppColor.textGreyColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500
                      ),
                      overflow: TextOverflow.visible,
                    ),
                    SizedBox(height: 5.h,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}