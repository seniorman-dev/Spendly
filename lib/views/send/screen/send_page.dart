import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendly/utils/colors/app_theme.dart';
import 'package:spendly/views/send/widget/beneficiary/beneficiary_empty_state.dart';
import 'package:spendly/views/send/widget/cash_back_card.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CashbackCard(),
            //SizedBox(height: 10.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
              child: Text(
                'Note: you get up to N100 cashback on every bill payment from N2,000 and above',
                style: GoogleFonts.inter(
                  color: AppColor.darkGreyColor, //.withOpacity(0.2),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
            //Beneficiary List
            BeneficiaryEmtyState(),
            //SendCard
            SendCard(
              onTap: () {},
              icon: CupertinoIcons.square_arrow_up_on_square_fill,
              title: 'Send to wallet address',
              subtitle: "Send to any Spendly account for free",
            ),
            SendCard(
              onTap: () {},
              icon: CupertinoIcons.location_fill,
              title: 'Send to Bank Account',
              subtitle: "Send to a local bank account",
            ),

        
          ],
        ),
      ),
    );
  }
}