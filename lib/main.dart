import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spendly/utils/colors/app_theme.dart';
import 'package:spendly/views/auth/screen/onboarding/screen/onboarding_screen.dart';
import 'package:spendly/views/mainpage/screen/mainpage.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';




void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  //keep beneath this widgetflutterbinding widget
  //usePathUrlStrategy();
  
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: AppColor.bgColor,
      statusBarColor: AppColor.bgColor,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  
  //initialize firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //initialize get_storage
  await GetStorage.init() ;

  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (_, child) {
        return child!;
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Spendly',
        home: OnBoardingPage(), //LoginPage()
      ),
    );
  }
}

