import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendly/controllers/home/home_page_controller.dart';
import 'package:spendly/utils/colors/app_theme.dart';






class WalletCard extends StatelessWidget {
  WalletCard({super.key, required this.dollarBalance, required this.nairaBalance});
  final String dollarBalance;
  final String nairaBalance;
  
  //DEPENDENCY INJECTION
  var controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            colors: [
              AppColor.mainColor,
              //Color.fromARGB(255, 8, 123, 158),
              //AppColor.mainColor.withOpacity(0.4),
              //AppColor.mainColor,
              Color.fromARGB(255, 8, 123, 158),
            ]
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            //USD & NAIRA FLIPPER HERE
            Obx(
              () {
                return Container(
                  alignment: Alignment.center,
                  //padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  height: 40.h,
                  width: 150.w,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(30.r)
                  ),
                  child: DropdownButton<String>(
                    style: GoogleFonts.inter(
                      color: AppColor.bgColor,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500
                    ),
                    elevation: 3,
                    dropdownColor: AppColor.blackColor,
                    underline: SizedBox(),
                    borderRadius: BorderRadius.circular(15.r),
                    iconEnabledColor: AppColor.bgColor,
                    icon: Icon(
                      CupertinoIcons.chevron_down,
                      color: AppColor.bgColor,
                      //size: 20.r,
                    ),
                    iconSize: 20.r,
                    enableFeedback: true,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    value: controller.selectedValue.value,
                    onChanged: (newValue) { 
                      // When the user selects an option, update the selectedValue
                      controller.toggleWalletBalance(newValue);
                    },
                    items: controller.items.map((item) {
                      return DropdownMenuItem(
                        onTap: () {
                      
                          debugPrint("drop down menu tapped!!");
                          if(item == 'USDT Balance    ') {
                            controller.isWalletBalanceToggled.value = true;
                          }
                          else{
                            controller.isWalletBalanceToggled.value = false;
                          }
  
                        },                    
                        value: item,
                        child: Text(
                          item,
                          style: GoogleFonts.inter(
                            color: AppColor.bgColor,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              }
            ),

            SizedBox(height: 10.h,),
            Obx(
              () {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    controller.isWalletBalanceObscured.value 
                    ?Text(
                      '**********',
                      style: GoogleFonts.inter(
                        color: AppColor.bgColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600
                      ),
                    )
                    :Text(
                      controller.isWalletBalanceToggled.value
                      ?dollarBalance
                      :nairaBalance,
                      style: GoogleFonts.atma(
                        color: AppColor.bgColor,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w600
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    //SizedBox(width: 5.w,),
                    IconButton(
                      onPressed: () {
                        controller.isWalletBalanceObscured.value = !controller.isWalletBalanceObscured.value;
                      }, 
                      icon: Icon(
                        controller.isWalletBalanceObscured.value ?
                        Icons.visibility_off_outlined : Icons.visibility_outlined,
                        color: AppColor.bgColor,
                        size: 22.r,
                      )
                    )
                  ],
                );
              }
            ),

            SizedBox(height: 20.h,),

            //TRANSFER BUTTONS HERE
            Row(
              children: [
                //TRANSFER BUTTON
                Expanded(
                  child: InkWell(
                    onTap:() {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 55.h,
                      decoration: BoxDecoration(
                        color: AppColor.mainColor.withOpacity(0.4), //Colors.transparent,
                        //border: Border.all(color: AppColor.bgColor),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.location, //paperplane,
                            color: AppColor.bgColor,
                            size: 24.r,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Send Funds',
                            style: GoogleFonts.inter(
                              color: AppColor.bgColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500
                            ),
                            //overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      )
                    ),
                  ),
                ),

                SizedBox(width: 15.w,),

                //ADD MONEY BUTTON
                Expanded(
                  child: InkWell(
                    onTap:() {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 55.h,
                      decoration: BoxDecoration(
                        color: AppColor.mainColor.withOpacity(0.4), //Colors.transparent,
                        //border: Border.all(color: AppColor.bgColor),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.creditcard,
                            color: AppColor.bgColor,
                            size: 24.r,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Add Funds',
                            style: GoogleFonts.inter(
                              color: AppColor.bgColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500
                            ),
                            //overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      )
                    ),
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}