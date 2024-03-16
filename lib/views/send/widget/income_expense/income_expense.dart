import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendly/utils/colors/app_theme.dart';







class IncomeAndExpenseWidget extends StatelessWidget {
  const IncomeAndExpenseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //INCOME WIDGET
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                //height: 55.h,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                decoration: BoxDecoration(
                  //color: AppColor.mainColor.withOpacity(0.1),
                  color: AppColor.normalGreen.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      CupertinoIcons.arrow_down_left,
                      color: AppColor.blackColor,
                      size: 24.r,
                    ),
                    SizedBox(width: 10.w,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Funds in",
                            style: GoogleFonts.inter(
                              color: AppColor.textGreyColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400
                            ),
                            overflow: TextOverflow.visible,
                          ),
                          SizedBox(height: 5.h,),
                          Text(
                            "N600000.00",
                            style: GoogleFonts.atma(
                              color: AppColor.blackColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(width: 15.w,),

          
          //Expense Widget
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                //height: 55.h,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: AppColor.redColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      CupertinoIcons.arrow_up_right,
                      color: AppColor.blackColor,
                      size: 24.r,
                    ),
                    SizedBox(width: 10.w,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Funds out",
                            style: GoogleFonts.inter(
                              color: AppColor.textGreyColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400
                            ),
                            overflow: TextOverflow.visible,
                          ),
                          SizedBox(height: 5.h,),
                          Text(
                            "N40066.00",
                            style: GoogleFonts.atma(
                              color: AppColor.blackColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}