import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' as getx;
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:spendly/views/auth/screen/onboarding/widget/first_page.dart';
import 'package:spendly/views/auth/screen/onboarding/widget/second_page.dart';
import 'package:spendly/views/auth/screen/onboarding/widget/third_page.dart';
import 'package:country_code_picker/country_code_picker.dart';







class AuthController extends getx.GetxController {

  bool isObscure = false;
  var isLoading = false.obs;

  //ONBOARDING SECTION//
  final List<Widget> pages = [
    const FirstPage(),
    const SecondPage(),
    const ThirdPage(),
  ];
  
  //LOGIN SECTION
  GlobalKey<FormState> loginFormKey =  GlobalKey<FormState>();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  //REGISTER SECTION
  GlobalKey<FormState> registerFormKey =  GlobalKey<FormState>();
  TextEditingController registerNameController = TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPhoneNumberController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerConfirmPasswordController = TextEditingController();
  //phone number selector
  var phone_code = "".obs; 
  void onCountryChange(CountryCode countryCode) {
    //TODO : manipulate the selected country code here
    phone_code.value = countryCode.dialCode.toString();
    //phone_code.isEmpty ? "+234" : phone_code.value;
    debugPrint("New Country selected: ${phone_code.value}");
    update();
  }

  //FORGOT PASSWORD SECTION
  GlobalKey<FormState> forgotPasswordFormKey =  GlobalKey<FormState>();
  TextEditingController forgotPasswordEmailController = TextEditingController();






  @override
  void dispose() {
    // TODO: implement dispose
    loginEmailController.dispose();
    loginPasswordController.dispose();
    registerNameController.dispose();
    registerEmailController.dispose();
    registerPasswordController.dispose();
    registerConfirmPasswordController.dispose();
    registerPhoneNumberController.dispose();
    forgotPasswordEmailController.dispose();
    super.dispose();
  }
  

}

