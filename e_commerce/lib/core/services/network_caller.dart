import 'dart:convert';
import 'dart:nativewrappers/_internal/vm/lib/math_patch.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

/// Represents the response structure for network requests
class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  late final Map<String, dynamic>? statusData;
  String? errorMessage;

  NetworkResponse({
    required this.statusCode,
    required this.isSuccess,
    this.statusData,
    this.errorMessage = 'Something is wrong',
  });
}



class NetworkCaller {
  final Logger _logger = Logger();

  /// Sends a GET request
   Future<NetworkResponse> getRequest({
    required String url,
    Map<String, dynamic>? params}) async {
    try {
      final uri = Uri.parse(url); // Parse the URL
      Map<String, String> headers = {'token': ''};

      _logRequest(url: url, headers: headers);



      // Send GET request with an authorization token
      Response response =
      await get(uri, headers: headers);

      _logResponse(url: url, response: response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          statusData: jsonDecode(response.body),
        );
      }
      // Handle unauthorized (401) response
      else if (response.statusCode == 401) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          statusData: jsonDecode(response.body),
        );
      }
      else {
        return NetworkResponse(
          statusCode: response.statusCode,
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
    required String url,
    required Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url); // Parse the URL

      Map<String,String> headers = {
        'Content-Type': 'application/json',
        'token':  ''
      };

      _logRequest(url: url, headers: headers);

      Response response = await post(
          uri,
          body: jsonEncode(body),
          headers: headers
      );

      _logResponse(url: url, response: response);

      debugPrint('Status Code = ${response.statusCode}');
      debugPrint('Response Data = ${response.body}');


      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          statusData: jsonDecode(response.body),
        );
      }
      // Handle unauthorized (401) response
      else if (response.statusCode == 401) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          statusData: jsonDecode(response.body),
        );
      }
      else {
        return NetworkResponse(
          statusCode: response.statusCode,
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


  void _logResponse({required String url, required Response response}){
    // code hare
    _logger.i(
        'Url = $url\nHeaders = ${response.headers}\nBody = ${response.body}\nStatus Code = ${response.statusCode}');
  }



}

