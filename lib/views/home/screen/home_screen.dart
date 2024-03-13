import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendly/services/auth_service/auth_service.dart';
import 'package:spendly/utils/colors/app_theme.dart';
import 'package:spendly/views/home/widget/header.dart';
import 'package:spendly/views/home/widget/quick_action.dart';
import 'package:spendly/views/home/widget/transaction/trx_list.dart';
import 'package:spendly/views/home/widget/ugrade_kyc.dart';
import 'package:spendly/views/home/widget/wallet_card.dart';





class HomePage extends StatelessWidget {
  HomePage({super.key});

  var authService = Get.put(AuthService());

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

            /*Center(
              child: IconButton(
                onPressed: () {
                  authService.logOut(context: context);
                }, 
                color: AppColor.mainColor,
                icon: Icon(Icons.logout_outlined)
              ),
            ),*/
            //SizedBox(height: 5.h,),

            //HEADER
            HomeHeader(
              profilePic: '',
              userName: 'Henry Ebele',
              onNotificationPressed: () {
                authService.logOut(context: context);
              },
            ),
            
            //BODY
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h,),
                    WalletCard(
                      dollarBalance: '\$3000.40', 
                      nairaBalance: 'N5000.00',
                    ),
                    SizedBox(height: 10.h,),
                    UpgradeKYCAlert(
                      onUpgrade: () {},
                    ),
                    SizedBox(height: 10.h,),
                    //QUICK ACTIONS
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w,),
                      child: Text(
                        'Quick actions',
                        style: GoogleFonts.inter(
                          color: AppColor.blackColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    QuickAction(),
                    SizedBox(height: 10.h,),
                    //TRANSACTIONS LIST
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w,),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Transactions',
                            style: GoogleFonts.inter(
                              color: AppColor.blackColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          InkWell(
                            onTap: () {
                              
                            },
                            child: Text(
                              'See more >',
                              style: GoogleFonts.inter(
                                color: AppColor.lightNormalGreen,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    //SizedBox(height: 10.h,),
                    TrxList()
                  ],
                ),
              ),
            ),  
        
          ],
        ),
      ),
    );
  }
}