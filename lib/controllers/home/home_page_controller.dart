import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' as getx;
import 'package:spendly/views/home/screen/home_screen.dart';




class HomePageController extends getx.GetxController {
  
  //FOR WALLET CARD/////
  //list of wallet balance (currency)
  final isWalletBalanceToggled = false.obs;
  final isWalletBalanceObscured = false.obs;
  final List<String> items = [
    'USDT Balance    ', 
    'NAIRA Balance    ', 
  ];
  final selectedValue = 'NAIRA Balance    '.obs; //SAVED TO DB
  void toggleWalletBalance(String? newValue) {
    selectedValue.value = newValue!;
  }


  //FOR KYC ALERT CARD/////
  final isKYCAlertCancelled = false.obs;


}