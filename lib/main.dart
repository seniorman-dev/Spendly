import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spendly/services/data_service/auth_state/firebase_auth_state.dart';
import 'package:spendly/services/data_service/fcm_api/fcm_api.dart';
import 'package:spendly/services/data_service/local_storage/local_storage.dart';
import 'package:spendly/utils/colors/app_theme.dart';
import 'package:spendly/views/auth/screen/onboarding/screen/onboarding_screen.dart';
import 'package:spendly/views/mainpage/screen/mainpage.dart';
import 'firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';




var controller = Get.put(FCMAPIController());
//Top level non-anonymous function for FCM push notifications for background mode
Future<void> backgroundHandler(RemoteMessage message) async {
  debugPrint('Handling a background message ${message.data}');
  controller.displayNotification(message);
}



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

  //FCM Instance
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  //Get Unique FCM DEVICE TOKEN AND SAVE TO GETSTORAGE()
  String? token = await messaging.getToken();
  await LocalStorage.saveFCMToken(token!);

  //check for existing fcmtoken
  var token_up = LocalStorage.getFCMToken();
  print("my_FCMtoken: $token_up");

  runApp(const MyApp());
}



class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    //initialize firebase cloud messaging
    controller.initFCM(backgroundHandler: backgroundHandler);
    super.initState();
  }

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
        home: FirebaseCheck(), //OnBoardingPage(), //LoginPage()
      ),
    );
  }
}

