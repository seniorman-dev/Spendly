import 'package:flutter/material.dart';
import 'package:spendly/controllers/main_page_controller.dart';
import '../widget/bottom_bar_widget.dart';





class MainPage extends StatefulWidget {
  const MainPage({super.key,});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final MainPageController controller = MainPageController();

  void _onItemTapped(int index) {
    setState(() {
      controller.selectedIndex = index;
    });
  }
  
  /*dynamic _onItemTapped(int index) {
    setState(() {
      controller.setIndex(index);
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: controller.widgetOptions.elementAt(controller.selectedIndex),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: controller.selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}