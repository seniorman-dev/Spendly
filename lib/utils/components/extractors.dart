// Example function to extract the first name from the full name.
String getFirstName({required String fullName}) {
  List<String> nameParts = fullName.split(' '); // Split by space
  String firstName = nameParts[0]; // Get the first part
  return firstName.trim(); // Remove leading and trailing spaces (if any)
}

// Example function to extract the last name from the full name.
String getLastName({required String fullName}) {
  List<String> nameParts = fullName.split(' '); // Split by space
  String firstName = nameParts[1]; // Get the first part
  return firstName.trim(); // Remove leading and trailing spaces (if any)
}


// 
String getJustNumber({required String phoneNumber}) {
  String num = phoneNumber.substring(0, 2);  //.split(''); // Split by space
  return num; // Remove leading and trailing spaces (if any)
}

//get the first letter of a user name
String getFirstLetter(String displayName) {
  // Split the display name into parts based on spaces
  List<String> nameParts = displayName.split(' ');

  // Check if there is at least one part (a first name)
  if (nameParts.isNotEmpty) {
    // Get the first part (first name)
    String firstName = nameParts.first;

    // Check if the first name is not empty
    if (firstName.isNotEmpty) {
      // Extract the first letter
      String firstLetter = firstName[0];

      // Return the first letter
      return firstLetter;
    }
  }
  // Return an empty string if no valid first letter is found
  return '';
}


String getUserUrlSlug(String textController) {
  // Extract the substring "jjj"
  String result = textController.substring(textController.lastIndexOf("/") + 1);

  print('Original string: $textController');
  print('Substring: $result');
  return result;
}

