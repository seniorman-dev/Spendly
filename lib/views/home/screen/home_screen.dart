import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spendly/services/auth_service/auth_service.dart';
import 'package:spendly/utils/colors/app_theme.dart';






class HomePage extends StatelessWidget {
  HomePage({super.key});

  var authService = Get.put(AuthService());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        onPressed: () {
          authService.logOut(context: context);
        }, 
        color: AppColor.mainColor,
        icon: Icon(Icons.logout_outlined)
      ),
    );
  }
}