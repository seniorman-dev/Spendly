import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendly/utils/colors/app_theme.dart';
import 'package:spendly/views/invest/widget/investment_options_card.dart';
import 'package:spendly/views/invest/widget/portfolio/portfolio_empty_state.dart';







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
                      'Invest with us',
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
                      title: 'Agriculture',
                      sub_title: 'Invest in our farm produce and live stock and receive monthly interests',
                      icon: CupertinoIcons.leaf_arrow_circlepath,
                    ),
                    SizedBox(width: 15.w,),
                    InvestmentCard(
                      onTap: () {},
                      title: 'Crypto',
                      sub_title: 'Buy and hold BTC or USDT for a certain period and secure profits.',
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
                      title: 'Energy',
                      sub_title: 'Invest in our solar energy products and get standard ROIs',
                      icon:  CupertinoIcons.sun_max_fill,
                    ),
                    SizedBox(width: 15.w,),
                    InvestmentCard(
                      onTap: () {},
                      title: 'Fixed Deposits',
                      sub_title: 'safe lock your funds with us per annum and receive up to 20% interest',
                      icon: CupertinoIcons.chart_pie_fill,
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
              /////NO PORTFOLIO EMPTY STATE//////
              PortfolioEmptyState(),
            ]
          )
        )
      )
    );
  }
}