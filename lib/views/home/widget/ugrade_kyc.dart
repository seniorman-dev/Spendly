import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendly/controllers/home/home_page_controller.dart';
import 'package:spendly/utils/colors/app_theme.dart';






class UpgradeKYCAlert extends StatelessWidget {
  UpgradeKYCAlert({super.key, required this.onUpgrade});
  final VoidCallback onUpgrade;

  var controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return controller.isKYCAlertCancelled.value ? SizedBox() : GestureDetector(
          onTap: onUpgrade,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
              //height: 40.h,
              decoration: BoxDecoration(
                color: AppColor.yellowStarColor.withOpacity(0.25),
                borderRadius: BorderRadius.circular(15.r)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.warning_rounded,
                    color: AppColor.yellowStarColor,
                    size: 35.r,
                  ),
                  
                  SizedBox(
                    width: 10.w,
                  ),
        
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 280.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Upgrade your KYC',
                              style: GoogleFonts.inter(
                                color: AppColor.blackColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5.h,),
                            Text(
                              'upload your valid credentials to access feature',
                              style: GoogleFonts.inter(
                                color: AppColor.darkGreyColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
        
                      SizedBox(width: 5.w,),
        
                      InkWell(
                        onTap: () {
                          controller.isKYCAlertCancelled.value = true;
                        },
                        child: Icon(
                          CupertinoIcons.xmark,
                          size: 26.r,
                          color: AppColor.blackColor,
                        )
                      )
        
                    ],
                  )
                ],
              ),
        
            ),
          ),
        );
      }
    );
  }
}