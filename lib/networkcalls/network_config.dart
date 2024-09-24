import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:iobm/utils/app_constants.dart';

class NetworkConfig {
  static Future<ApiResponse> getWebCall(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      return _checkResponse(response);
    } on SocketException {
      return ApiResponse(
          done: false,
          errorMsg: "Error With internet connection",
          responseString: null);
    }
  }

  static ApiResponse _checkResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return ApiResponse(
            done: true, errorMsg: null, responseString: response.body);
      case 400:
        return ApiResponse(
            done: false, errorMsg: "Bad request", responseString: null);
      case 401:
        return ApiResponse(
            done: false, errorMsg: "Bad request", responseString: null);
      case 403:
        return ApiResponse(
            done: false, errorMsg: "unauthrized request", responseString: null);
      case 404:
        return ApiResponse(
            done: false, errorMsg: "Page not found", responseString: null);
      case 500:
        return ApiResponse(
            done: false, errorMsg: "Server Error", responseString: null);
      default:
        return ApiResponse(
            done: false,
            errorMsg: "Error occured while Communication with or timeout",
            responseString: null);
    }
  }

  static Future<ApiResponse> getWebCallWithToken(String url) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${AppConstants.bearerToken}',
      };
      var response = await http.get(Uri.parse(url), headers: headers);
      return _checkResponse(response);
    } on SocketException {
      return ApiResponse(
          done: false,
          errorMsg: "Error With internet connection",
          responseString: null);
    }
  }

  static Future postWebCall(String url, Map map) async {
    print(url);
    print(map);
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(map),
      );

      debugPrint(response.statusCode.toString());
      return _checkResponse(response);
    } on SocketException {
      return ApiResponse(
          done: false,
          errorMsg: "Error With internet connection",
          responseString: null);
    }
  }

  static Future postWebWithTokenCall(String url, Map map) async {
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${AppConstants.bearerToken}',
        },
        body: jsonEncode(map),
      );
      return _checkResponse(response);
    } on SocketException {
      return ApiResponse(
          done: false,
          errorMsg: "Error With internet connection",
          responseString: null);
    }
  }

  static Future<ApiResponse> uploadFile(
      {String? url, Map? map, String? imagePath}) async {
    try {
      var postUri = Uri.parse(url!);
      var request = http.MultipartRequest("POST", postUri);

      map!.forEach((key, value) {
        request.fields[key] = value;
      });
      var multipartFile = await http.MultipartFile.fromPath("image", imagePath!,
          contentType: MediaType('image', 'jpeg'));
      request.files.add(multipartFile);

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      return _checkResponse(response);
    } on SocketException {
      return ApiResponse(
          done: false,
          errorMsg: "Error With internet connection",
          responseString: null);
    }
  }

  static Future<ApiResponse> uploadFileWithToken(
      String url, Map map, String imagePath) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'multipart/form-data',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${AppConstants.bearerToken}',
      };

      var postUri = Uri.parse(url);
      var request = http.MultipartRequest("POST", postUri);
      map.forEach((key, value) {
        request.fields[key] = value;
      });
      var multipartFile = await http.MultipartFile.fromPath(
        "image",
        imagePath,
        contentType: MediaType('image', 'jpeg'),
      );
      request.files.add(multipartFile);
      request.headers.addAll(headers);
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      return _checkResponse(response);
    } on SocketException {
      return ApiResponse(
          done: false,
          errorMsg: "Error With internet connection",
          responseString: null);
    }
  }

  static Future<ApiResponse> uploadProfileFileWithToken(
      String url, Map map, String imagePath) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${AppConstants.bearerToken}',
      };

      var postUri = Uri.parse(url);
      var request = http.MultipartRequest("POST", postUri);
      map.forEach((key, value) {
        request.fields[key] = value;
      });
      var multipartFile = await http.MultipartFile.fromPath(
          "image[]", imagePath,
          contentType: MediaType('image', 'jpeg'));
      request.files.add(multipartFile);
      request.headers.addAll(headers);
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      return _checkResponse(response);
    } on SocketException {
      return ApiResponse(
          done: false,
          errorMsg: "Error With internet connection",
          responseString: null);
    }
  }

  static Future<ApiResponse> uploadFiles(
      {required String url,
      required Map<String, dynamic> map,
      String keyName= 'image',
      required List<File> images,
      bool token= false}) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      if (token) {
        headers['Authorization'] = 'Bearer ${AppConstants.bearerToken}';
      }

      var postUri = Uri.parse(url);
      var request = http.MultipartRequest("POST", postUri);
      map.forEach((key, value) {
        request.fields[key] = '$value';
      });
      if (images.length > 0) {
        keyName = '$keyName[]';
      }
      images.forEach((element) async {
        if (element is File) {
          var multipartFile = await http.MultipartFile.fromPath(
              keyName, element.path,
              contentType: MediaType('image', 'jpeg'));
          request.files.add(multipartFile);
        }
      });

      request.headers.addAll(headers);
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      return _checkResponse(response);
    } on SocketException {
      return ApiResponse(
          done: false,
          errorMsg: "Error With internet connection",
          responseString: null);
    }
  }
}

// ignore: camel_case_types
class ApiResponse {
  String? responseString;
  String? errorMsg;
  bool? done;

  ApiResponse({this.done, this.errorMsg, this.responseString});
}
