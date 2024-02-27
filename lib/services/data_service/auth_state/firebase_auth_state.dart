import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spendly/services/auth_service/auth_service.dart';
import 'package:spendly/utils/colors/app_theme.dart';
import 'package:spendly/utils/components/loader.dart';
import 'package:spendly/views/auth/screen/onboarding/screen/onboarding_screen.dart';
import 'package:spendly/views/mainpage/screen/mainpage.dart';




class FirebaseCheck extends StatelessWidget {
  FirebaseCheck({Key? key}) : super(key: key);

  var authController = Get.put(AuthService());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.bgColor,
        body: StreamBuilder<User?>(
          stream: authController.firebase.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return const Loader2();
            }
            else if(snapshot.connectionState == ConnectionState.active) {
              if(snapshot.data == null) {
                return const OnBoardingPage(); //splashscreen
              }
              else {
                return const MainPage(); //splashscreen
              }
            }
            else {
              return const ErrorLoader();
            }
          }
        )
      ),
    );
  }
}