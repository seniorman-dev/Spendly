import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:spendly/utils/colors/app_theme.dart';






class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.fourRotatingDots( //threeArchedCircle
        color: AppColor.mainColor,
        size: 55.r,
      ),
    );
  }
}


class Loader2 extends StatelessWidget {
  const Loader2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.waveDots( 
        color: AppColor.mainColor,
        size: 45.r,
      ),
    );
  }
}