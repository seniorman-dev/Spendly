import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';



String formatDate({required Timestamp timestamp}) {
  DateTime dateTime = timestamp.toDate();
  String formattedTime = DateFormat.yMMMMd().format(dateTime);
  return formattedTime;
}

String formatTime({required Timestamp timestamp}) {
  DateTime dateTime = timestamp.toDate();
  String formattedTime = DateFormat.jm().format(dateTime);
  return formattedTime;
}