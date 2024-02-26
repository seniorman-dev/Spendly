import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendly/controllers/auth/auth_controller.dart';
import 'package:spendly/utils/colors/app_theme.dart';
import 'package:spendly/utils/components/rebranded_reusable_button.dart';
import 'package:spendly/views/auth/screen/forgot_password/forgot_password.dart';
import 'package:spendly/views/auth/screen/register/register_screen.dart';
import 'package:spendly/views/auth/screen/widget/auth_fields.dart';
import 'package:spendly/views/auth/screen/widget/login_with_google.dart';





class LoginPage extends StatelessWidget {
  LoginPage({super.key});

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
            Center(
              child: SvgPicture.asset(
                'assets/svg/login.svg',
                height: 260.h, //280.h,
                //width: 450.w,
              ),
            ),
            SizedBox(height: 20.h,),
            Center(
              child: Text(
                "Welcome back!",
                style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColor.darkGreyColor
                ),
              ),
            ),
            SizedBox(height: 30.h,),
            //Form and textfields
            Form(
              key:controller.loginFormKey,
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
                    hintText: "Your email address",
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    textController: controller.loginEmailController, 
                    prefixIcon: Icon(
                      CupertinoIcons.mail_solid, 
                      color: AppColor.textGreyColor,
                      size: 24.r,
                    ),                         
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
                      return   ""; //controller.validateLoginPassword();
                    },*/   
                    hintText: "Enter password",
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    textController: controller.loginPasswordController,
                    isObscured: controller.isObscure, 
                    prefixIcon: Icon(
                      Icons.lock, 
                      color: AppColor.textGreyColor,
                      size: 24.r,
                    ),                                                  
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(() => ForgotPasswordPage());        
                        },
                        child: Text(
                          "Forgot Password?",
                          style: GoogleFonts.inter(
                            color: AppColor.darkGreyColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500
                          )
                        )
                      ),
                    ],
                  ),
                  SizedBox(height: 70.h),
                  RebrandedReusableButton(
                    color: AppColor.mainColor, 
                    text: "Login", 
                    onPressed: () {}, 
                    textColor: AppColor.bgColor
                  ),
                  SizedBox(height: 30.h),
                  LoginWithGoogleWidget(
                    onGoogleSignIn: () {
                      //authService.signInWithGoogle(context: context);
                    },
                    onTextButton: () {
                      //Get.offUntil(GetPageRoute(page: () => RegisterPage()), (route) => false);
                      Get.to(() => RegisterPage());
                    },
                    firstText: "Don't have an account?",
                    lastText: "Create account",
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