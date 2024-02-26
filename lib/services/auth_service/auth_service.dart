import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart' as getx;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spendly/controllers/auth/auth_controller.dart';
import 'package:spendly/services/data_service/fcm_api/fcm_api.dart';
import 'package:spendly/services/data_service/local_storage/local_storage.dart';
import 'package:spendly/utils/colors/app_theme.dart';
import 'package:spendly/utils/components/my_snackbar.dart';
import 'package:spendly/views/mainpage/screen/mainpage.dart';






class AuthService extends getx.GetxController {

  final FirebaseAuth firebase = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  User? get user => firebase.currentUser;
  String get userId => firebase.currentUser!.uid;
  String? get userDisplayName => firebase.currentUser!.displayName;
  String? get userEmail => firebase.currentUser!.email;
  var FCMToken = LocalStorage.getFCMToken();
  var authController = getx.Get.put(AuthController());
  var fcmAPIController = getx.Get.put(FCMAPIController());




  //REGISTER USER
  Future<dynamic> registerUser({required BuildContext context}) async {
    try {
      if(authController.registerNameController.text.isNotEmpty && authController.registerEmailController.text.isNotEmpty && authController.registerPasswordController.text == authController.registerConfirmPasswordController.text && authController.registerPhoneNumberController.text.isNotEmpty) {
      
        UserCredential userCredential = await firebase.createUserWithEmailAndPassword(email: authController.registerEmailController.text, password: authController.registerPasswordController.text);
        if(userCredential.user != null) {

          //save to local storage for independent use
          LocalStorage.saveUsername(authController.registerNameController.text);
          LocalStorage.saveUserID(userCredential.user!.uid);
          LocalStorage.saveEmail(userCredential.user!.email!);
          //call firestore to add the new user
          await firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
            'id': userCredential.user!.uid,
            'name': authController.registerNameController.text,
            'email': authController.registerEmailController.text,
            'password': authController.registerConfirmPasswordController.text,
            'photo': 'photo_url',
            'fcm_token': FCMToken,
            'is_email_verified': false,
            'created_at': Timestamp.now(),
          })
          .then((value) {
            //send push notification
            fcmAPIController.sendNotification(
              targetUserToken: FCMToken, 
              title: "Account successfully created",
              body: "Hey ${authController.registerNameController.text}, welcome to Spendly.", 
            );
            authController.registerNameController.clear();
            authController.registerEmailController.clear();
            authController.registerPasswordController.clear();
            authController.registerConfirmPasswordController.clear();
            getx.Get.offAll(() => const MainPage());
          });

        }

        else {
          return showMySnackBar(
            context: context, 
            message: "something went wrong", 
            backgroundColor: AppColor.redColor
          );
        }
      }
      else {
        return showMySnackBar(
          context: context, 
          message: "invalid credentials", 
          backgroundColor: AppColor.redColor
        );
      }
    } 
    on FirebaseAuthException catch (e) {
      return showMySnackBar(
        context: context, 
        message: "error: $e", 
        backgroundColor: AppColor.redColor
      );
    }
  }
  


  //LOGIN USER
  Future<dynamic> loginUser({required BuildContext context}) async {
    try {
      if(authController.loginEmailController.text.isNotEmpty && authController.loginPasswordController.text.isNotEmpty) {
      
        UserCredential userCredential = await firebase.signInWithEmailAndPassword(email: authController.loginEmailController.text, password: authController.loginPasswordController.text);
        if(userCredential.user != null) {

          //get the snapshot data of a particular document in db
          DocumentSnapshot snapshot = await firestore
          .collection('users')
          .doc(userId)
          .get();
          String name = snapshot.get('name');
          String email = snapshot.get('email');
          String id = snapshot.get('id');

          //save to local storage for independent use
          LocalStorage.saveUsername(name);
          LocalStorage.saveUserID(id);
          LocalStorage.saveEmail(email);
          
        
          return showMySnackBar(
            context: context, 
            message: "log in successful", 
            backgroundColor: AppColor.darkGreenColor
          ).whenComplete(() {
            //clear the text cotrollers
            authController.loginEmailController.clear();
            authController.loginPasswordController.clear();
            getx.Get.offAll(() => const MainPage());
          });
        

        }

        else {
          return showMySnackBar(
            context: context, 
            message: "something went wrong", 
            backgroundColor: AppColor.redColor
          );
        }
      }
      else {
        return showMySnackBar(
          context: context, 
          message: "invalid credentials", 
          backgroundColor: AppColor.redColor
        );
      }
    } 
    on FirebaseAuthException catch (e) {
      return showMySnackBar(
        context: context, 
        message: "error: $e", 
        backgroundColor: AppColor.redColor
      );
    }
  }


}

