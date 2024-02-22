import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendly/utils/colors/app_theme.dart';






class SpendlySnackBar {

  static errorSnackBar({required String message,  Widget? icon}) {
    Get.rawSnackbar(
      snackStyle: SnackStyle.FLOATING,
      message: message,
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: Get.width / 1.85,
            child: Wrap(
              children: [
                Text(
                  message,
                  style: GoogleFonts.inter(
                    color: AppColor.bgColor,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      snackPosition: SnackPosition.TOP,
      borderRadius: 10.r,
      icon: Icon(
        CupertinoIcons.xmark_circle,
        color: AppColor.bgColor
      ),
      isDismissible: false,
      backgroundColor: AppColor.redColor
    );
  }

  static noInternet({required String message, message2,  Widget? icon}) {
    Get.rawSnackbar(
      snackStyle: SnackStyle.GROUNDED,
      boxShadows: [
        BoxShadow(
          color: AppColor.bgColor.withOpacity(0.1),
          spreadRadius: 5.r,
          blurRadius: 5.r,
        )
      ],
      message: message,
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            //width: Get.width / 1.85,
            child: Wrap(
              children: [
                Text(
                  '$message $message2',
                  style: GoogleFonts.inter(
                    color: AppColor.textGreyColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp,
                    //height: 1.6.h,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      snackPosition: SnackPosition.TOP,
      borderRadius: 10.r,
      icon: Icon(
        CupertinoIcons.xmark_circle,
        color: AppColor.textGreyColor,
      ),
      isDismissible: false,
      backgroundColor: AppColor.bgColor,
    );
  }

  static successSnackBar({required String message,}) {
    return Get.rawSnackbar(
      snackStyle: SnackStyle.FLOATING,
      message: message,
      messageText: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            //width: Get.width / 1.85,
            child: Wrap(
              children: [
                Text(
                  message,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: AppColor.bgColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      snackPosition: SnackPosition.TOP,
      borderRadius: 15.r,
      icon: Icon(
        CupertinoIcons.check_mark_circled,
        color: AppColor.bgColor,
      ),
      isDismissible: false,
      backgroundColor: AppColor.darkGreenColor,
    );
  }
}
