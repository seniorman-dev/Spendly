import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:spendly/controllers/auth/auth_controller.dart';
import 'package:spendly/utils/colors/app_theme.dart';
import 'package:spendly/utils/components/rebranded_reusable_button.dart';
import 'package:spendly/views/auth/screen/login/screen/login_screen.dart';



class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: buildBody(context),
      )
    );
  }

  Widget buildBody(BuildContext context) {

    var controller = Get.put(AuthController());
    final size = MediaQuery.of(context).size;
    int activePage = 0;
    final PageController pageViewController = PageController(initialPage: activePage);

    return Column(
      children: [        
        SizedBox(height: 110.h), //100.h
        //PageView.builder() Widget
        SizedBox(
          height: 550.h, //445.h
          width: size.width,  //double.infinity
          child: PageView.builder( 
            scrollDirection: Axis.horizontal,
            itemCount: controller.pages.length,
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (value) {
              setState(() {
                activePage = value;
              });
              debugPrint('$activePage');
            },
            itemBuilder: (context, index) {
              return controller.pages[index];
            }
          ),
        ),
        SizedBox(height: 30),
        //SmoothPageIndicator
        SmoothPageIndicator(
          //activeIndex: activePage,
          controller: pageViewController, 
          count: controller.pages.length,  
          onDotClicked: (index) {
            pageViewController.animateToPage(
              index, 
              duration: const Duration(milliseconds: 300), 
              curve: Curves.elasticInOut
            );
          }, 
          effect: WormEffect(
            dotHeight: 10.0,  //8
            dotWidth: 10.0, //25
            dotColor: Colors.grey.withOpacity(0.2),
            activeDotColor: AppColor.mainColor,
            type: WormType.normal,
          ),
        ),                  
        //SizedBox(height: 20.h),
        //for the two buttons
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 80.h),
              RebrandedReusableButton(
                color: AppColor.mainColor, 
                text: "Get Started", 
                onPressed: () {
                  Get.to(() => LoginPage());
                }, 
                textColor: AppColor.bgColor
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
          
      ],  
    );
  }
}