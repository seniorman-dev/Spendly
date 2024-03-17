import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';





class PortfolioEmptyState extends StatelessWidget {
  const PortfolioEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: SvgPicture.asset(
        'assets/svg/revenue.svg',
        height: 420.h,
        width: double.infinity,
      ),
    );
  }
}