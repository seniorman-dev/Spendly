import 'package:share_plus/share_plus.dart';



Future<void> shareAccountLink({required String link}) async{

  final result = await Share.share("Please view my profile\n\n$link"); 

  return result;

}


Future<void> shareReferralLink({required String link}) async{

  final result = await Share.share("Check out my service.😊\n\n$link"); 

  return result;

}