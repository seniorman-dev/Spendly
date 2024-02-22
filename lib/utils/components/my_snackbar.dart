import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendly/utils/colors/app_theme.dart';




Future<void> showMySnackBar({required BuildContext context, required String message, required Color backgroundColor}) async{
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      dismissDirection: DismissDirection.down,
      backgroundColor: backgroundColor,
      showCloseIcon: false,
      content: Text(
        textAlign: TextAlign.center,
        message,
        style: GoogleFonts.inter(
          color: AppColor.bgColor,
          fontSize: 13.sp,
          fontWeight: FontWeight.normal
        ),
      ),
      duration: Duration(seconds: 2), // Adjust the duration as needed
      /*action: SnackBarAction(
        label: 'CLOSE',
        onPressed: () {
          // Perform an action when the user presses the action button
        },
      ),*/
    ),
  );
}