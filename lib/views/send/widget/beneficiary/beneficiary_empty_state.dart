import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendly/utils/colors/app_theme.dart';



class BeneficiaryEmtyState extends StatelessWidget {
  const BeneficiaryEmtyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Container(
        alignment: Alignment.center,
        //height: 55.h,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: AppColor.mainColor,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              CupertinoIcons.person_2_fill,
              color: AppColor.bgColor,
            ),
            SizedBox(width: 15.w,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Beneficiary',
                    style: GoogleFonts.inter(
                      color: AppColor.bgColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          "Put your favorite people in one place",
                          style: GoogleFonts.inter(
                            color: AppColor.lightBgColor,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400
                          ),
                          overflow: TextOverflow.visible,
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          height: 40.h,
                          width: 85.w,
                          //padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                          decoration: BoxDecoration(
                            color: AppColor.lightNormalGreen,
                            //border: Border.all(color: AppColor.bgColor),
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Text(
                            '+ Add new',
                            style: GoogleFonts.inter(
                              color: AppColor.lightBgColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                      ),  
              
              
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}