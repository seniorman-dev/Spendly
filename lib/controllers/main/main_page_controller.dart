import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart' as getx;




class MainPageController extends getx.GetxController {
  
  //selected index
  int selectedIndex = 0;

  //widget options
  final List<Widget> widgetOptions = <Widget>[
    SizedBox(),
    SizedBox(),
    SizedBox(),
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
        activeIcon: Icon(CupertinoIcons.paperplane_fill),
        icon: Icon(CupertinoIcons.paperplane),
        label: 'Send',
      ),
      BottomNavigationBarItem(
        activeIcon: Icon(Icons.trending_up_rounded),
        icon: Icon(Icons.trending_up_rounded),
        label: 'Invest',
      ),
      BottomNavigationBarItem(
        activeIcon: Icon(Icons.space_dashboard_rounded),
        icon: Icon(Icons.space_dashboard_outlined),
        label: 'More',
      ),
    ];
  }
}