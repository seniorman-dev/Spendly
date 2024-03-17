import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendly/utils/colors/app_theme.dart';
import 'package:spendly/views/home/widget/transaction/trx_list.dart';
import 'package:spendly/views/send/widget/beneficiary/beneficiary_empty_state.dart';
import 'package:spendly/views/send/widget/beneficiary/beneficiary_list.dart';
import 'package:spendly/views/send/widget/cash_back/cash_back_card.dart';
import 'package:spendly/views/send/widget/income_expense/income_expense.dart';
import 'package:spendly/views/send/widget/send_option/send_card.dart';





class SendPage extends StatelessWidget {
  const SendPage({super.key});

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
          
              //Cash back widget
              CashbackCard(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColor.greyColor
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        CupertinoIcons.info_circle,
                        size: 24.r,
                        color: AppColor.textGreyColor,
                      ),
                      SizedBox(width: 10.w,),
                      Expanded(
                        child: Text(
                          'You get up to N100 cashback on every bill payment from N2,000 and above',
                          style: GoogleFonts.inter(
                            color: AppColor.textGreyColor, //.withOpacity(0.2),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400
                          ),
                          overflow: TextOverflow.visible //.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          
              //Beneficiary List Widgets
              SizedBox(height: 20.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Beneficiaries',
                      style: GoogleFonts.inter(
                        color: AppColor.blackColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    /*InkWell(
                      onTap: () {},
                      child: Text(
                        'See more >',
                        style: GoogleFonts.inter(
                          color: AppColor.lightNormalGreen,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    )*/
                  ],
                ),
              ),
              //BeneficiaryList(),
              BeneficiaryEmtyState(),

              SizedBox(height: 10.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Income & Expenses',
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
              IncomeAndExpenseWidget(),
          
              SizedBox(height: 10.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Send Funds',
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
              //SendCard
              SendCard(
                onTap: () {},
                icon: CupertinoIcons.location_fill,
                title: 'Send to wallet address',
                subtitle: "Send to any Spendly account for free",
              ),
              SendCard(
                onTap: () {},
                icon: Icons.assured_workload_rounded,
                title: 'Send to Bank Account',
                subtitle: "Send to a local bank account",
              ),
              SizedBox(height: 15.h,),
          
          
          
            ],
          ),
        ),
      ),
    );
  }
}