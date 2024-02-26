import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart' as getx;
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:spendly/views/auth/screen/onboarding/widget/first_page.dart';
import 'package:spendly/views/auth/screen/onboarding/widget/second_page.dart';
import 'package:spendly/views/auth/screen/onboarding/widget/third_page.dart';








class AuthController extends getx.GetxController {


  var isLoading = false.obs;

  //ONBOARDING SECTION//
  final List<Widget> pages = [
    const FirstPage(),
    const SecondPage(),
    const ThirdPage(),
  ];
  
  //LOGIN SECTION
  final isObscure = false;
  GlobalKey<FormState> loginFormKey =  GlobalKey<FormState>();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();





  @override
  void dispose() {
    // TODO: implement dispose
    loginEmailController.dispose();
    loginPasswordController.dispose();
    super.dispose();
  }
  

}

