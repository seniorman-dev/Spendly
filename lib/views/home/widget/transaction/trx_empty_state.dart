import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';



class TrxEmptyState extends StatelessWidget {
  const TrxEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset('assets/svg/no_trx.svg'),
    );
  }
}