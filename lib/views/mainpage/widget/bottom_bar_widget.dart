import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spendly/controllers/main/main_page_controller.dart';
import 'package:spendly/utils/colors/app_theme.dart';





class BottomNavBar extends StatefulWidget {
  final Function(int) onItemTapped;
  final int selectedIndex;
  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  final MainPageController controller = MainPageController();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColor.bgColor,
      selectedItemColor: AppColor.mainColor,
      unselectedItemColor: Colors.grey.withOpacity(0.8),
      items: controller.navBarsItems(),
      type: BottomNavigationBarType.fixed,
      currentIndex: widget.selectedIndex,
      iconSize: 29,
      onTap: widget.onItemTapped,
      elevation: 8, //5,
      selectedLabelStyle: GoogleFonts.inter(),
      unselectedLabelStyle: GoogleFonts.inter(),
    );
  }
}