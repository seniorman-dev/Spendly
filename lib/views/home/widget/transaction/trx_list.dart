import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spendly/views/home/widget/transaction/trx_display.dart';




class TrxList extends StatelessWidget {
  const TrxList({super.key,});


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      separatorBuilder: (context, index) => SizedBox(height: 30.h,), //Divider(color: Colors.grey.withOpacity(0.2), thickness: 0.3,)
      itemCount: 3,
      itemBuilder: (context, index) {
        return TrxDisplay(
          index: index,
        );
      },
    );
  }
}