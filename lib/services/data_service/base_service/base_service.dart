
import 'package:dio/dio.dart' as dioG;
import 'package:get/get.dart' as getX;






class BaseService extends getX.GetxController {
  

  //General Base URL
  //String baseUrl = "";
  //String baseUrlForGoogle = "";



  //DIO (DELETE REQUEST)
  Future<dynamic> deleteRequestWithDio({required String token, required String url}) async {
    try {
      // Create Dio instance
      dioG.Dio dio = dioG.Dio();

      // Optionally, you can configure additional options like headers, etc.
      dio.options.headers =
      {
        'Authorization': 'Bearer $token',
        "Accept": "*/*",
        "Content-Type": "application/json",
        "Connection": "keep-alive",
      };

      // Perform the DELETE request
      dioG.Response response = await dio.delete(url);

      // Handle the response as needed
      print('DELETE Request Status Code: ${response.statusCode}');
      print('DELETE Request Response Data: ${response.data}');
      return response;
    } catch (e) {
      // Handle errors
      print('Error during DELETE request: $e');
      Exception('Error during DELETE request: $e');
    }
  }

   //DIO (DELETE REQUEST) WITH BODY
  Future<dynamic> deleteRequestWithBodyDio({required String token, required String url, required dynamic data}) async {
    try {
      // Create Dio instance
      dioG.Dio dio = dioG.Dio();

      // Optionally, you can configure additional options like headers, etc.
      dio.options.headers =
      {
        'Authorization': 'Bearer $token',
        "Accept": "*/*",
        "Content-Type": "application/json",
        "Connection": "keep-alive",
      };

      // Perform the DELETE request
      dioG.Response response = await dio.delete(url, data: data);

      // Handle the response as needed
      print('DELETE Request Status Code: ${response.statusCode}');
      print('DELETE Request Response Data: ${response.data}');
      return response;
    } catch (e) {
      // Handle errors
      print('Error during DELETE request: $e');
      Exception('Error during DELETE request: $e');
    }
  }
  
  //POST REQUEST WITH Dio
  Future<dynamic> putRequestWithDio({ 
    required String url, 
    required String token,
    required dynamic data
  }) async {
    try {
      // Create Dio instance
      dioG.Dio dio = dioG.Dio();

      // Optionally, you can configure additional options like headers, etc.
      dio.options.headers =
      {
        'Authorization': 'Bearer $token',
        "Accept": "*/*",
        "Content-Type": "application/json",
        "Connection": "keep-alive",
      };

      // Perform the POST request
      dioG.Response response = await dio.put(
        url,
        data: data,
      );
      // Handle the response as needed
      print('PUT Request Status Code: ${response.statusCode}');
      print('PUT Request Response Data: ${response.data}');
      return response;
    } catch (e) {
      // Handle errors
      print('Error during PUT request: $e');
    }
  }

  //POST REQUEST WITH Dio
  Future<dynamic> postRequestWithDio({ 
    required String url,
    required String token,
    required dynamic data
  }) async {
    try {
      // Create Dio instance
      dioG.Dio dio = dioG.Dio();

      // Optionally, you can configure additional options like headers, etc.
      dio.options.headers =
      {
        'Authorization': 'Bearer $token',
        "Accept": "*/*",
        "Content-Type": "application/json",
        "Connection": "keep-alive",
      };

      // Perform the POST request
      dioG.Response response = await dio.post(
        url,
        data: data,
      );
      // Handle the response as needed
      print('POST Request Status Code: ${response.statusCode}');
      print('POST Request Response Data: ${response.data}');
      return response;
    } catch (e) {
      // Handle errors
      print('Error during POST request: $e');
    }
  }

  //GET REQUEST WITH Dio
  Future<dioG.Response> getRequestWithDio({ 
    required String url,
    required String token, 
  }) async{
    try {
      // Create Dio instance
      dioG.Dio dio = dioG.Dio();

      // Optionally, you can configure additional options like headers, etc.
      dio.options.headers = 
      {
        'Authorization': 'Bearer $token',
        "Accept": "*/*",
        "Content-Type": "application/json",
        "Connection": "keep-alive",
      };

      // Perform the Get request
      dioG.Response response = await dio.get(
        url,
        //data: data,
      );
      // Handle the response as needed
      print('GET Request Status Code: ${response.statusCode}');
      print('GET Request Response Data: ${response.data}');
      return response;
    } catch (e) {
      // Handle errors
      throw Exception('Error during GET request: $e');
    }
  }

  


  
}


