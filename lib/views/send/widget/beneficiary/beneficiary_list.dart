import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spendly/views/send/widget/beneficiary/beneficiary_display.dart';






class BeneficiaryList extends StatelessWidget {
  const BeneficiaryList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120.h,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        separatorBuilder: (context, index) => SizedBox(width: 13.w),
        itemCount: 10,
        itemBuilder: (context, index) {
          return BeneficiaryDisplay(
            onTap: (){},
            name: "Japhet",
          );
        },
      ),
    );
  }
}