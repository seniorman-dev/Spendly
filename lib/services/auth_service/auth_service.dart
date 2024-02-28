import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart' as getx;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spendly/controllers/auth/auth_controller.dart';
import 'package:spendly/services/data_service/fcm_api/fcm_api.dart';
import 'package:spendly/services/data_service/local_storage/local_storage.dart';
import 'package:spendly/utils/colors/app_theme.dart';
import 'package:spendly/utils/components/my_snackbar.dart';
import 'package:spendly/views/auth/screen/login/login_screen.dart';
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
  var isLoading = false.obs;




  //REGISTER USER
  Future<dynamic> registerUser({required BuildContext context}) async {
    isLoading.value = true;
    try {
      if(authController.registerNameController.text.isNotEmpty && authController.registerEmailController.text.isNotEmpty && authController.registerPasswordController.text == authController.registerConfirmPasswordController.text && authController.registerPhoneNumberController.text.isNotEmpty) {
      
        UserCredential userCredential = await firebase.createUserWithEmailAndPassword(email: authController.registerEmailController.text, password: authController.registerPasswordController.text);
        if(userCredential.user != null) {
          isLoading.value = false;
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
            'phone_number': authController.registerPhoneNumberController.text,
            'photo': '',
            'fcm_token': FCMToken,
            'is_email_verified': false,
            'account_created_from': "LOCAL",
            'created_at': Timestamp.now(),
          })
          .whenComplete(() {
            //send push notification
            fcmAPIController.sendNotification(
              targetUserToken: FCMToken, 
              title: "Account created successfully",
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
          isLoading.value = false;
          return showMySnackBar(
            context: context, 
            message: "something went wrong", 
            backgroundColor: AppColor.redColor
          );
        }
      }
      else {
        isLoading.value = false;
        return showMySnackBar(
          context: context, 
          message: "fields must not be empty", 
          backgroundColor: AppColor.redColor
        );
      }
    } 
    on FirebaseAuthException catch (e) {
      isLoading.value = false;
      return showMySnackBar(
        context: context, 
        message: "failed to register user: $e", 
        backgroundColor: AppColor.redColor
      );
    }
  }
  


  //LOGIN USER
  Future<dynamic> loginUser({required BuildContext context}) async {
    isLoading.value = true;
    try {
      if(authController.loginEmailController.text.isNotEmpty && authController.loginPasswordController.text.isNotEmpty) {
      
        UserCredential userCredential = await firebase.signInWithEmailAndPassword(email: authController.loginEmailController.text, password: authController.loginPasswordController.text);
        if(userCredential.user != null) {
          isLoading.value = false;
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
            message: "login successful", 
            backgroundColor: AppColor.darkGreenColor
          ).whenComplete(() {
            //clear the text cotrollers
            authController.loginEmailController.clear();
            authController.loginPasswordController.clear();
            getx.Get.offAll(() => const MainPage());
          });
        

        }

        else {
          isLoading.value = false;
          return showMySnackBar(
            context: context, 
            message: "something went wrong", 
            backgroundColor: AppColor.redColor
          );
        }
      }
      else {
        isLoading.value = false;
        return showMySnackBar(
          context: context, 
          message: "fields must not be empty", 
          backgroundColor: AppColor.redColor
        );
      }
    } 
    on FirebaseAuthException catch (e) {
      isLoading.value = false;
      return showMySnackBar(
        context: context, 
        message: "failed to log user in: $e", 
        backgroundColor: AppColor.redColor
      );
    }
  }


  //LOGOUT METHOD
  Future<void> logOut({required BuildContext context}) async {
    isLoading.value = true;
    try { 
      isLoading.value = false;
      await firebase.signOut()
      .whenComplete(() {
        LocalStorage.deleteUserID();
        LocalStorage.deleteUseremail();
        LocalStorage.deleteUsername();
        getx.Get.offAll(() => LoginPage());
      });
    } 
    on FirebaseAuthException catch (e) {
      isLoading.value = false;
      return showMySnackBar(
        context: context, 
        message: "failed to log user out: $e", 
        backgroundColor: AppColor.redColor
      );
    }
  }

  //ResetPassword Method
  Future resetPassword ({
    required String email,
    required BuildContext context
  }) async {
    isLoading.value = true;
    try {  
      if(email.isNotEmpty) {
        isLoading.value = false;
        await firebase.sendPasswordResetEmail(email: email)
        .whenComplete(() {
          //send push notification
          fcmAPIController.sendNotification(
            targetUserToken: FCMToken, 
            title: "Password reset link sent",
            body: "Hi, your reset link has been sent. kindly check your email", 
          );
        });
      }
      else {
        isLoading.value = false;
        return showMySnackBar(
          context: context, 
          message: "email field must not be empty", 
          backgroundColor: AppColor.redColor
        );
      }
    } 
    on FirebaseAuthException catch (e) {
      isLoading.value = false;
      return showMySnackBar(
        context: context, 
        message: "failed to send password reset link: $e", 
        backgroundColor: AppColor.redColor
      );
    }
  }


  //Login or Sign Up with Google
  Future<void> signInWithGoogle({required BuildContext context}) async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']); // Add desired scopes
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        isLoading.value = true;
        print("Google fetched user successfully");
        // User signed in successfully
        // You can also fetch additional information if needed
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken
        );
        
        UserCredential userCredential = await firebase.signInWithCredential(credential);
        print("${userCredential.user!.displayName}");
        print("${userCredential.user!.email}");
        
        //save to local storage for independent use
        LocalStorage.saveUsername(userCredential.user!.displayName!);
        LocalStorage.saveUserID(userCredential.user!.uid);
        LocalStorage.saveEmail(userCredential.user!.email!);
        //call firestore to set the  user
        await firestore
        .collection('users')
        .doc(userCredential.user!.uid)
        .set({
          'id': userCredential.user!.uid,
          'name': userCredential.user!.displayName,
          'email': userCredential.user!.email,
          'password': "google",
          //leave it empty
          'phone_number': userCredential.user!.phoneNumber ?? "",
          'photo': userCredential.user!.photoURL ?? '',
          'fcm_token': FCMToken,
          'is_email_verified': true,
          'account_created_from': "GOOGLE",
          'created_at': Timestamp.now(),
        })
        .whenComplete(() {
          isLoading.value = false;
          showMySnackBar(
            context: context,
            backgroundColor: AppColor.darkGreenColor,
            message: "signed in successfully"
          );
          getx.Get.offAll(() => const MainPage());
        });

      } 
      else {
        isLoading.value = false;
        // User cancelled the sign-in process
        print("Google Sign-In cancelled by the user");
      }

    }
    on PlatformException catch (e) {
      isLoading.value = false;
      if (e.code == GoogleSignIn.kNetworkError) {
        print(e.code);
        String errorMessage = "A network error (such as timeout, interrupted connection or unreachable host) has occurred.";
        showMySnackBar(
          context: context,
          backgroundColor: AppColor.redColor,
          message: errorMessage
        );
      }
      else if (e.code == GoogleSignIn.kSignInCanceledError) {
        // User cancelled the sign-in process
        print("Google Sign-In cancelled by the user");
        print(e.code);
        // Handle errors gracefully
        showMySnackBar(
          context: context,
          backgroundColor: AppColor.redColor,
          message: "Sign-In process terminated or cancelled"
        );
      }
      else if (e.code == GoogleSignIn.kSignInFailedError) {
        // User cancelled the sign-in process
        print(e.code);
        // Handle errors gracefully
        showMySnackBar(
          context: context,
          backgroundColor: AppColor.redColor,
          message: "Sign-In process failed"
        );
      }
      else {        
        String errorMessage = "Something went wrong.";
        showMySnackBar(
          context: context,
          backgroundColor: AppColor.redColor,
          message: errorMessage
        );
      }
    }
    catch (e, stackTrace) {
      isLoading.value = false;
      print("Error during Google Sign-In: $e => $stackTrace");
      // Handle errors gracefully
      showMySnackBar(
        context: context,
        backgroundColor: AppColor.redColor,
        message: "error during Google Sign-In: $e => $stackTrace"
      );
    }
  }





}

