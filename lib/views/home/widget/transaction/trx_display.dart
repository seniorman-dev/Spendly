import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendly/utils/colors/app_theme.dart';





class TrxDisplay extends StatelessWidget {
  const TrxDisplay({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          index.isOdd
          ?CupertinoIcons.arrow_down_left //money in
          :CupertinoIcons.arrow_up_right, //money out
          size: 24.r,
          color: index.isOdd ?
          AppColor.darkGreenColor //AppColor.redColor
          :AppColor.redColor
        ),
        SizedBox(width: 10.w,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //row 1
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      index.isOdd ? 'Transfer from OLADIPUPO OMOWUNMI' : 'Transfer to Joel Agbanwe',
                      style: GoogleFonts.inter(
                        color: AppColor.blackColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 10.w,),
                  Text(
                    index.isOdd ? '+N12777900.00' : '-N25000000.00',
                    style: GoogleFonts.atma(
                      color: AppColor.blackColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              SizedBox(height: 10.h,),
              //row 2
              Text(
                index.isOdd ? '2024-04-23 8:40 PM' : '2024-02-09 10:20 AM',
                style: GoogleFonts.inter(
                  color: AppColor.darkGreyColor.withOpacity(0.6),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.normal
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        )
      ],
    );
  }
}