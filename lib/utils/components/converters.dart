import 'dart:core';
import 'package:intl/intl.dart';



// Function 1: Convert string to DateTime object
DateTime convertStringToDateTime(String dateString) {
  try {
    // Assuming the input string is in the format yyyy-mm-dd
    List<String> dateParts = dateString.split('-');
    int year = int.parse(dateParts[0]);
    int month = int.parse(dateParts[1]);
    int day = int.parse(dateParts[2]);
    
    return DateTime(year, month, day);
  } catch (e) {
    // Handle parsing errors, e.g., invalid format
    print('Error converting string to DateTime: $e');
    throw Exception("$e");
  }
}

// Function 2: Display today's date as a DateTime object
DateTime getTodaysDate() {
  return DateTime.now();
}

// Function 3: Check how close a particular Date is to today's date
String checkDateProximity(DateTime otherDate) {
  DateTime today = getTodaysDate();
  Duration difference = today.difference(otherDate).abs();
  
  if (difference.inDays == 0) {
    return 'The date is today!';
  } else {
    String proximity = (today.isBefore(otherDate)) ? 'future' : 'past';
    String unit = (difference.inDays == 1) ? 'day' : 'days';
    
    return 'The date is ${difference.inDays} $unit in the $proximity.';
  }
}

// Function 4: Check how far a DateTime is from today's date
String checkDateDistance(DateTime otherDate) {
  DateTime today = getTodaysDate();
  Duration difference = today.difference(otherDate).abs();
  
  if (difference.inDays == 0) {
    return 'The date is today!';
  } else {
    String proximity = (today.isBefore(otherDate)) ? 'future' : 'past';
    String unit = (difference.inDays == 1) ? 'day' : 'days';
    
    return 'The date is ${difference.inDays} $unit ${proximity == 'future' ? 'ahead of' : 'ago from'} today.';
  }
}

// Function to check if a date is in the past
bool isDateInPast(DateTime date) {
  DateTime today = getTodaysDate();
  return date.isBefore(today);
}

// Function to check if a date is in the future
bool isDateInFuture(DateTime date) {
  DateTime today = getTodaysDate();
  return date.isAfter(today);
}

// Function to convert firebase servertimestamp to date string
String convertServerTimestampToDateString(int timestamp) {
  // Convert the timestamp to a DateTime object
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp, isUtc: true);

  // Use the toString method
  String formattedDate = dateTime.toString();
  String finalResult = formattedDate.substring(0, 10);

  print(finalResult); // Output: 2023-01-27 20:48:47.960
  return finalResult;
}

// Function to extract time from firebase servertimestamp to time string
String convertServerTimestampToTimeString(int timestamp) {
  // Convert the timestamp to a DateTime object
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

  // Use the intl package to format the time
  String formattedTime = DateFormat('HH:mm a').format(dateTime);

  print(formattedTime); // Output: 20:48:47
  return formattedTime;
}