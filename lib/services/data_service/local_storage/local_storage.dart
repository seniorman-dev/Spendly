import 'package:get_storage/get_storage.dart';





class LocalStorage {

  /// use this to [saveTokenExpDate] to local storage
  static saveTokenExpDate(int expDate) {
    return GetStorage().write("tokenExp", expDate);
  }

  /// use this to [getTokenExpDate] from local storage
  static getTokenExpDate() {
    return GetStorage().read("tokenExp");
  }


  /// use this to [saveToken] to local storage
  static saveFCMToken(String tokenValue) {
    return GetStorage().write("FCMToken", tokenValue);
  }

  /// use this to [getToken] from local storage
  static getFCMToken() {
    return GetStorage().read("FCMToken");
  }



  /// use this to [saveToken] to local storage
  static saveToken(String tokenValue) {
    return GetStorage().write("token", tokenValue);
  }

  /// use this to [getToken] from local storage
  static getToken() {
    return GetStorage().read("token");
  }

  /// use this to [deleteToken] from local storage
  static deleteToken() {
    return GetStorage().remove("token");
  }


  /// use this to [saveUseremail] to local storage
  static saveEmail(String userEmail) {
    return GetStorage().write('email', userEmail);
  }
  /// use this to [getUseremail] from local storage
  static getUseremail() {
    return GetStorage().read('email');
  }

  /// use this to [deleteUseremail] from local storage
  static deleteUseremail() {
    return GetStorage().remove('email',);
  }



  /// use this to [saveUsername] to local storage
  static saveUsername(String userName) {
    return GetStorage().write('name', userName);
  }

  /// use this to [getUsername] from local storage
  static getUsername() {
    return GetStorage().read('name');
  }

  /// use this to [deleteUsername] from local storage
  static deleteUsername() {
    return GetStorage().remove('name',);
  }


  /// use this to [saveUserID] to local storage
  static saveUserID(String userId) {
    return GetStorage().write('id', userId);
  }

  /// use this to [getUserID] from local storage
  static getUserID() {
    return GetStorage().read('id');
  }

  /// use this to [deleteUserID] from local storage
  static deleteUserID() {
    return GetStorage().remove('id');
  }

  /// use this to save cloudinary secure url [imageUrl] temporarily to local storage
  static saveCloudinaryUrl(String imageUrl) {
    return GetStorage().write('image', imageUrl);
  }

  /// use this to [getImageUrl] from local storage
  static getCloudinaryUrl() {
    return GetStorage().read('image');
  }

  /// use this to [deleteImageURL] from local storage
  static deleteCloudinaryUrl() {
    return GetStorage().remove('image');
  }

}
