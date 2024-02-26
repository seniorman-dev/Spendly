import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendly/controllers/auth/auth_controller.dart';
import 'package:spendly/utils/colors/app_theme.dart';
import 'package:spendly/utils/components/country_code_widget.dart';
import 'package:spendly/utils/components/rebranded_reusable_button.dart';
import 'package:spendly/views/auth/screen//login/login_screen.dart';
import 'package:spendly/views/auth/screen/widget/auth_fields.dart';
import 'package:spendly/views/auth/screen/widget/login_with_google.dart';







class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

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
            SizedBox(height: 60.h,),
            /*Center(
              child: SvgPicture.asset(
                'assets/svg/sign_up.svg',
                height: 230.h, //280.h,
                //width: 450.w,
              ),
            ),
            SizedBox(height: 20.h,),*/
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Create New Account",
                    style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.darkGreyColor
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Text(
                    'kick start your journey to financial freedom\n                 by filling these details',
                    style: GoogleFonts.inter(
                      color: Colors.grey,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h,),
            //Form and textfields
            Form(
              key: controller.registerFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Full Name",
                    style: GoogleFonts.inter(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.darkGreyColor
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  AuthCustomTextField(
                    onChanged: (val) {},
                    hintText: "Your full name",
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    textController: controller.registerNameController, 
                    prefixIcon: Icon(
                      CupertinoIcons.person_solid, 
                      color: AppColor.textGreyColor,
                      size: 24.r,
                    ),                         
                  ),
                  SizedBox(height: 20.h,),

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
                      return ""; //controller.validateRegisterEmail(value: val!);
                    },*/
                    hintText: "Your email address",
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    textController: controller.registerEmailController, 
                    prefixIcon: Icon(
                      CupertinoIcons.mail_solid, 
                      color: AppColor.textGreyColor,
                      size: 24.r,
                    ),                         
                  ),
                  SizedBox(height: 20.h,),

                  Text(
                    "Phone Number",
                    style: GoogleFonts.inter(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.darkGreyColor
                    ),
                  ),
                  SizedBox(height: 20.h,),

                  AuthPhoneNumberTextField(
                    onChanged: (val) {},
                    hintText: "Your phone number",
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    textController: controller.registerPhoneNumberController, 
                    countrycode: CountryCodeWidget(
                      onCountryChanged: (CountryCode val) {
                        controller.onCountryChange(val);
                      }
                    )                         
                  ),
                  
                  
                  SizedBox(height: 20.h,),

                  Text(
                    "Password",
                    style: GoogleFonts.inter(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.darkGreyColor
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  AuthPasswordTextField(
                    onChanged: (val) {},
                    /*validator: (val) {
                      return   ""; //controller.validateRegisterPassword();
                    },*/   
                    hintText: "Enter your password",
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    textController: controller.registerPasswordController,
                    isObscured: controller.isObscure, 
                    prefixIcon: Icon(
                      Icons.lock, 
                      color: AppColor.textGreyColor,
                      size: 24.r,
                    ),                                                  
                  ),

                  SizedBox(height: 20.h,),
                  Text(
                    "Confirm Password",
                    style: GoogleFonts.inter(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColor.darkGreyColor
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  AuthPasswordTextField(
                    onChanged: (val) {},
                    /*validator: (val) {
                      return   ""; //controller.validateRegisterConfirmPassword();
                    },*/   
                    hintText: "Re-enter your password",
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    textController: controller.registerConfirmPasswordController,
                    isObscured: controller.isObscure, 
                    prefixIcon: Icon(
                      Icons.lock, 
                      color: AppColor.textGreyColor,
                      size: 24.r,
                    ),                                                  
                  ),
                  
                ],
              ),
            ),
            SizedBox(height: 80.h),
            RebrandedReusableButton(
              color: AppColor.mainColor, 
              text: "Create account", 
              onPressed: () {}, 
              textColor: AppColor.bgColor
            ),
            SizedBox(height: 30.h),
            SignUpWithGoogleWidget(
              onGoogleSignIn: () {
                //authService.signInWithGoogle(context: context);
              },
              onTextButton: () {
                Get.back();
              },
              firstText: "Have an account?",
              lastText: "Login",
            ),
          ],
        ),
      ),
      
    );
  }
}