import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendly/utils/colors/app_theme.dart';
import 'package:spendly/views/invest/widget/investment_options_card.dart';




class InvestPage extends StatelessWidget {
  const InvestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        //wrap with stream builder
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Invest with Spendly',
                      style: GoogleFonts.inter(
                        color: AppColor.blackColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),

                  ],
                ),
              ),
              SizedBox(height: 10.h,),
              //1
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InvestmentCard(
                      onTap: () {},
                      title: '',
                      sub_title: '',
                      icon: Icons.bar_chart_rounded,
                    ),
                    SizedBox(width: 15.w,),
                    InvestmentCard(
                      onTap: () {},
                      title: '',
                      sub_title: '',
                      icon: CupertinoIcons.bitcoin_circle_fill,
                    ),
                  ],
                ),
              ),
              //2
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InvestmentCard(
                      onTap: () {},
                      title: 'Invest in energy',
                      sub_title: '',
                      icon:  CupertinoIcons.lightbulb_fill,
                    ),
                    SizedBox(width: 15.w,),
                    InvestmentCard(
                      onTap: () {},
                      title: '',
                      sub_title: '',
                      icon: Icons.bar_chart_rounded,
                    ),
                  ],
                ),
              ),

              //PORTFOLIO TRACKING
              SizedBox(height: 20.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your portfolio',
                      style: GoogleFonts.inter(
                        color: AppColor.blackColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),

                  ],
                ),
              ),
              SizedBox(height: 10.h,),
            ]
          )
        )
      )
    );
  }
}