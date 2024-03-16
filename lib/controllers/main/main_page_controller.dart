import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart' as getx;
import 'package:spendly/views/home/screen/home_screen.dart';
import 'package:spendly/views/invest/screen/investment.dart';
import 'package:spendly/views/send/screen/send_page.dart';




class MainPageController extends getx.GetxController {
  
  //selected index
  int selectedIndex = 0;

  //widget options
  final List<Widget> widgetOptions = <Widget>[
    HomePage(),
    SendPage(),
    InvestPage(),
    SizedBox(),
  ];

  void setIndex(int index) {
    selectedIndex = index;
    update(); // This triggers a rebuild when the index changes
  }

  //navbar items
  List<BottomNavigationBarItem> navBarsItems() {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        activeIcon: Icon(CupertinoIcons.hexagon_fill),
        icon: Icon(CupertinoIcons.hexagon),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        activeIcon: Icon(CupertinoIcons.location_fill),
        icon: Icon(CupertinoIcons.location),
        label: 'Send',
      ),
      BottomNavigationBarItem(
        activeIcon: Icon(
          CupertinoIcons.graph_square_fill,
        ),
        icon: Icon(
          CupertinoIcons.graph_square
        ),
        label: 'Invest',
      ),
      BottomNavigationBarItem(
        activeIcon: Icon(
          CupertinoIcons.rectangle_3_offgrid_fill
        ),
        icon: Icon(
          CupertinoIcons.rectangle_3_offgrid
        ),
        label: 'More',
      ),
    ];
  }
}