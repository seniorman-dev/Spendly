import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendly/controllers/auth/auth_controller.dart';
import 'package:spendly/utils/colors/app_theme.dart';
import 'package:spendly/utils/components/rebranded_reusable_button.dart';
import 'package:spendly/views/auth/screen/widget/auth_fields.dart';





class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  //Dependency injection/Composition
  var controller = Get.put(AuthController());
  //var authService = Get.put(AuthService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h,),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                CupertinoIcons.chevron_left,
                color: AppColor.darkGreyColor,
              ),
            ),
            SizedBox(height: 40.h,),
            Center(
              child: SvgPicture.asset(
                'assets/svg/forgot_password.svg',
                height: 260.h, //280.h,
                //width: 450.w,
              ),
            ),
            SizedBox(height: 20.h,),
            Center(
              child: Text(
                "Forgot password?",
                style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.darkGreyColor
                ),
              ),
            ),
            SizedBox(height: 30.h,),
            Center(
              child: Text(
                "Don't fret. Enter your valid email address and we\n               will send you a password reset link",
                style: GoogleFonts.inter(
                  color: Colors.grey,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400
                ),
              ),
            ),
            SizedBox(height: 30.h,),
            //Form and textfields
            Form(
              key:controller.forgotPasswordFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email Address",
                    style: GoogleFonts.inter(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.darkGreyColor
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  AuthCustomTextField(
                    onChanged: (val) {},
                    /*validator: (val) {
                      return ""; //controller.validateLoginEmail(value: val!);
                    },*/
                    hintText: "Your valid email address",
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    textController: controller.forgotPasswordEmailController, 
                    prefixIcon: Icon(
                      CupertinoIcons.mail_solid, 
                      color: AppColor.textGreyColor,
                      size: 24.r,
                    ),                         
                  ),
                  
                  SizedBox(height: 100.h),

                  RebrandedReusableButton(
                    color: AppColor.mainColor, 
                    text: "Send Link", 
                    onPressed: () {}, 
                    textColor: AppColor.bgColor
                  ),
                
                ],
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}