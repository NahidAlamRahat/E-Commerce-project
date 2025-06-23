import 'dart:convert';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

/// Represents the response structure for network requests
class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  late final Map<String, dynamic>? statusData;
  String? errorMessage;
  String? successfullyMessage;

  NetworkResponse({
    required this.statusCode,
    required this.isSuccess,
    this.statusData,
    this.errorMessage = 'Something is wrong',
    this.successfullyMessage = 'Successfully'
  });
}



class NetworkCaller {
  final Logger _logger = Logger();

  /// Sends a GET request
  Future<NetworkResponse> getRequest({
    required String url, Map<String, dynamic>? params}) async {
    try {
      final uri = Uri.parse(url); // Parse the URL
      Map<String, String> headers = {'token': ''};

      _logRequest(url: url, headers: headers);



      // Send GET request with an authorization token
      Response response =
      await get(uri, headers: headers);

      _logResponse(url: url, response: response);

      final decodedResponse = jsonDecode(response.body);


      if (response.statusCode == 200 || response.statusCode == 201) {

        return NetworkResponse(
          statusCode: response.statusCode,
          successfullyMessage: decodedResponse['msg'],
          isSuccess: true,
          statusData: decodedResponse,

        );
      }
      // Handle unauthorized (401) response
      else if (response.statusCode == 401) {
        return NetworkResponse(
          statusCode: response.statusCode,
          errorMessage: decodedResponse['msg'],
          isSuccess: false,
          statusData: decodedResponse,
        );
      }
      else {
        return NetworkResponse(
          statusCode: response.statusCode,
          errorMessage: decodedResponse['msg'],
          isSuccess: false,
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }


  /// Sends a POST request to the [url].
  Future<NetworkResponse> postRequest({
    required String url, required Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url); // Parse the URL

      Map<String,String> headers = {
        'Content-Type': 'application/json',
        'token':  ''
      };

      _logRequest(url: url, headers: headers);

      Response response =
      await post(uri, headers: headers, body: jsonEncode(body));

      _logResponse(url: url, response: response);


      final decodedResponse = jsonDecode(response.body);


      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          statusData: decodedResponse,
          successfullyMessage: decodedResponse['msg'],

        );
      }
      // Handle unauthorized (401) response
      else if (response.statusCode == 401) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          statusData: decodedResponse,
          errorMessage: decodedResponse['msg'],
        );
      }
      else {
        return NetworkResponse(
          statusCode: response.statusCode,
          errorMessage: decodedResponse['msg'],
          isSuccess: false,
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }


  /// Sends a PUT request to the [url].
  Future<NetworkResponse> putRequest({
    required String url, required Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url); // Parse the URL

      Map<String,String> headers = {
        'Content-Type': 'application/json',
        'token':  ''
      };

      _logRequest(url: url, headers: headers);

      Response response =
      await put(uri, headers: headers, body: jsonEncode(body));

      _logResponse(url: url, response: response);


      final decodedResponse = jsonDecode(response.body);


      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          statusData: decodedResponse,
          successfullyMessage: decodedResponse['msg'],

        );
      }
      // Handle unauthorized (401) response
      else if (response.statusCode == 401) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          statusData: decodedResponse,
          errorMessage: decodedResponse['msg'],
        );
      }
      else {
        return NetworkResponse(
          statusCode: response.statusCode,
          errorMessage: decodedResponse['msg'],
          isSuccess: false,
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }


  /// Sends a PATCH request to the [url].
  Future<NetworkResponse> patchRequest({
    required String url, required Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url); // Parse the URL

      Map<String,String> headers = {
        'Content-Type': 'application/json',
        'token':  ''
      };

      _logRequest(url: url, headers: headers);

      Response response =
      await patch(uri, headers: headers, body: jsonEncode(body));

      _logResponse(url: url, response: response);


      final decodedResponse = jsonDecode(response.body);


      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          statusData: decodedResponse,
          successfullyMessage: decodedResponse['msg'],

        );
      }
      // Handle unauthorized (401) response
      else if (response.statusCode == 401) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          statusData: decodedResponse,
          errorMessage: decodedResponse['msg'],
        );
      }
      else {
        return NetworkResponse(
          statusCode: response.statusCode,
          errorMessage: decodedResponse['msg'],
          isSuccess: false,
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }


  /// Sends a DELETE request to the [url].
  Future<NetworkResponse> deleteRequest({
    required String url, required Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url); // Parse the URL

      Map<String,String> headers = {
        'Content-Type': 'application/json',
        'token':  ''
      };

      _logRequest(url: url, headers: headers);

      Response response =
      await delete(uri, headers: headers, body: jsonEncode(body));

      _logResponse(url: url, response: response);


      final decodedResponse = jsonDecode(response.body);


      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          statusData: decodedResponse,
          successfullyMessage: decodedResponse['msg'],

        );
      }
      // Handle unauthorized (401) response
      else if (response.statusCode == 401) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          statusData: decodedResponse,
          errorMessage: decodedResponse['msg'],
        );
      }
      else {
        return NetworkResponse(
          statusCode: response.statusCode,
          errorMessage: decodedResponse['msg'],
          isSuccess: false,
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }



  void _logRequest({required String url, required Map<String, dynamic> headers}){
    // code hare
    _logger.i('Url = $url\nHeaders = $headers');

  }


  void _logResponse({required String url, required Response response,}){
    // code hare
    _logger.i(
        'Url = $url\nHeaders = ${response.headers}\nBody = ${response.body}\nStatus Code = ${response.statusCode}');
  }



}