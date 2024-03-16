import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendly/utils/colors/app_theme.dart';








class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.profilePic, required this.userName, required this.onNotificationPressed});
  final String profilePic;
  final String userName;
  final VoidCallback onNotificationPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: AppColor.mainColor.withOpacity(0.5),
                radius: 33.r,
                child: CircleAvatar(
                  //backgroundImage: NetworkImage(profilePic),
                  backgroundColor: AppColor.greyColor,
                  radius: 31.r,
                ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi,',
                    style: GoogleFonts.inter(
                      color: Colors.grey.withOpacity(0.6),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Text(
                    userName,
                    style: GoogleFonts.inter(
                      color: AppColor.blackColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              )
            ],
          ),
          InkWell(
            onTap: onNotificationPressed,
            child: Container(
              alignment: Alignment.center,
              height: 50.h,
              width: 45.w,
              decoration: BoxDecoration(
                color: AppColor.bgColor,
                border: Border.all(color: Colors.grey.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(18.r)
              ),
              child: 
              //SvgPicture.asset('assets/svg/notify_active.svg'),
              Icon(
                CupertinoIcons.bell,
                color: AppColor.darkGreyColor,
                size: 30.r,
              )
            ),
          )
        ],
      )
    );
  }
}