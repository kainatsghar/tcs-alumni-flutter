import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:iobm/models/error_entity.dart';
import 'package:iobm/utils/app_constants.dart';

class NetworkCalls {
  static Future<dynamic> getWebCall(String url, {params}) async {
    print(url);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (AppConstants.bearerToken != "")
        'Authorization': 'Bearer ${AppConstants.bearerToken}',
    };
    try {
      Uri uri = Uri.parse(AppConstants.baseUrl + url);
      var response = await http.get(uri, headers: headers).timeout(
        const Duration(
          seconds: 45,
        ),
        onTimeout: () async {
          throw TimeoutException(
              'The connection has timed out, Please check your internet connection health and try again!');
        },
      );
      return _checkResponse(response);
    } on SocketException {
      return ErrorEntity()
        ..success = 0
        ..message = 'There is problem with the internet connection';
    } on TimeoutException catch (e) {
      return ErrorEntity()
        ..success = 0
        ..message =
            e.message ?? 'The connection has timed out, Please try again!';
    } catch (e) {
      return ErrorEntity()
        ..success = 0
        ..message = e.toString();
    }
  }

  static Future<dynamic> getWebCallWithToken(String url, {params}) async {
    print(AppConstants.baseUrl + url);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (AppConstants.bearerToken != "")
        'Authorization': 'Bearer ${AppConstants.bearerToken}',
    };

    try {
      Uri uri = Uri.parse(AppConstants.baseUrl + url);
      var response = await http.get(uri, headers: headers).timeout(
        const Duration(
          seconds: 45,
        ),
        onTimeout: () async {
          throw TimeoutException(
              'The connection has timed out, Please check your internet connection health and try again!');
        },
      );
      return _checkResponse(response);
    } on SocketException {
      return ErrorEntity()
        ..success = 0
        ..message = 'There is problem with the internet connection';
    } on TimeoutException catch (e) {
      return ErrorEntity()
        ..success = 0
        ..message =
            e.message ?? 'The connection has timed out, Please try again!';
    } catch (e) {
      return ErrorEntity()
        ..success = 0
        ..message = e.toString();
    }
  }

  static Future postWebCall(String url, Map map) async {
    print(url);
    print(map);
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      if (AppConstants.bearerToken != "")
        'Authorization': 'Bearer ${AppConstants.bearerToken}',
    };

    try {
      var response = await http
          .post(
        Uri.parse('${AppConstants.baseUrl}$url'),
        body: jsonEncode(map),
        headers: headers,
      )
          .timeout(
        const Duration(
          seconds: 45,
        ),
        onTimeout: () async {
          throw TimeoutException(
              "The connection has timed out, Please check your internet connection's health and try again!");
        },
      );
      return _checkResponse(response);
    } on SocketException {
      return ErrorEntity()
        ..success = 0
        ..message = 'There is problem with the internet connection';
    } on TimeoutException catch (e) {
      return ErrorEntity()
        ..success = 0
        ..message =
            e.message ?? 'The connection has timed out, Please try again!';
    } catch (e) {
      return ErrorEntity()
        ..success = 0
        ..message = e.toString();
    }
  }

  static Future postMultipartCall(String url, Map map) async {
    print(url);
    print(map);
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      if (AppConstants.bearerToken != "")
        'Authorization': 'Bearer ${AppConstants.bearerToken}',
    };

    try {
      var postUri = Uri.parse('${AppConstants.baseUrl}$url');
      var request = http.MultipartRequest("POST", postUri);
      request.headers.addAll(headers);

      map.forEach((key, value) {
        request.fields[key] = value;
      });
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse).timeout(
        const Duration(
          seconds: 45,
        ),
        onTimeout: () async {
          throw TimeoutException(
              "The connection has timed out, Please check your internet connection's health and try again!");
        },
      );

      return _checkResponse(response);
    } on SocketException {
      return ErrorEntity()
        ..success = 0
        ..message = 'There is problem with the internet connection';
    } on TimeoutException catch (e) {
      return ErrorEntity()
        ..success = 0
        ..message =
            e.message ?? 'The connection has timed out, Please try again!';
    } catch (e) {
      return ErrorEntity()
        ..success = 0
        ..message = e.toString();
    }
  }

  static Future postWebWithTokenCall(String url, Map map) async {
    print('${AppConstants.baseUrl}$url');
    print(map);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${AppConstants.bearerToken}',
    };

    try {
      var response = await http
          .post(
        Uri.parse('${AppConstants.baseUrl}$url'),
        headers: headers,
        body: jsonEncode(map),
      )
          .timeout(
        const Duration(
          seconds: 45,
        ),
        onTimeout: () async {
          throw TimeoutException(
              'The connection has timed out, Please check your internet connection health and try again!');
        },
      );
      return _checkResponse(response);
    } on SocketException {
      return ErrorEntity()
        ..success = 0
        ..message = 'There is problem with the internet connection';
    } on TimeoutException catch (e) {
      return ErrorEntity()
        ..success = 0
        ..message =
            e.message ?? 'The connection has timed out, Please try again!';
    } catch (e) {
      return ErrorEntity()
        ..success = 0
        ..message = e.toString();
    }
  }

  static Future<dynamic> uploadFile(
      String url, Map map, String imagePath) async {
    try {
      var postUri = Uri.parse(url);
      var request = http.MultipartRequest("POST", postUri);

      map.forEach((key, value) {
        request.fields[key] = value;
      });
      var multipartFile = await http.MultipartFile.fromPath("image", imagePath,
          contentType: MediaType('image', 'jpeg'));
      request.files.add(multipartFile);

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse).timeout(
        const Duration(
          seconds: 60,
        ),
        onTimeout: () async {
          throw TimeoutException(
              'The connection has timed out, Please check your internet connection health and try again!');
        },
      );
      return _checkResponse(response);
    } on SocketException {
      return ErrorEntity()
        ..success = 0
        ..message = 'There is problem with the internet connection';
    } on TimeoutException catch (e) {
      return ErrorEntity()
        ..success = 0
        ..message =
            e.message ?? 'The connection has timed out, Please try again!';
    } catch (e) {
      return ErrorEntity()
        ..success = 0
        ..message = e.toString();
    }
  }

  static Future<dynamic> uploadFileWorkOrder(
      String url, Map map, String imagePath) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${AppConstants.bearerToken}',
      };
      var postUri = Uri.parse(AppConstants.baseUrl + url);
      var request = http.MultipartRequest("POST", postUri);

      map.forEach((key, value) {
        request.fields[key] = value;
      });
      var multipartFile = await http.MultipartFile.fromPath("file", imagePath,
          contentType: MediaType('image', 'jpeg'));
      request.files.add(multipartFile);
      if (AppConstants.appName != 'BOSS') {
        request.headers.addAll(headers);
      }
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse).timeout(
        const Duration(
          seconds: 60,
        ),
        onTimeout: () async {
          throw TimeoutException(
              'The connection has timed out, Please check your internet connection health and try again!');
        },
      );
      return _checkResponse(response);
    } on SocketException {
      return ErrorEntity()
        ..success = 0
        ..message = 'There is problem with the internet connection';
    } on TimeoutException catch (e) {
      return ErrorEntity()
        ..success = 0
        ..message =
            e.message ?? 'The connection has timed out, Please try again!';
    } catch (e) {
      return ErrorEntity()
        ..success = 0
        ..message = e.toString();
    }
  }

  static Future<dynamic> uploadFileWithToken(
      {String? url, Map? map, String? imagePath, required param}) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${AppConstants.bearerToken}',
      };
      var postUri = Uri.parse("${AppConstants.baseUrl}$url");
      var request = http.MultipartRequest("POST", postUri);
      map?.forEach((key, value) {
        request.fields[key] = value;
      });
      var multipartFile = await http.MultipartFile.fromPath(param, imagePath!,
          contentType: MediaType(param, 'jpeg'));
      request.files.add(multipartFile);
      request.headers.addAll(headers);
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse).timeout(
        const Duration(
          seconds: 60,
        ),
        onTimeout: () async {
          throw TimeoutException(
              'The connection has timed out, Please check your internet connection health and try again!');
        },
      );
      return _checkResponse(response);
    } on SocketException {
      return ErrorEntity()
        ..success = 0
        ..message = 'There is problem with the internet connection';
    } on TimeoutException catch (e) {
      return ErrorEntity()
        ..success = 0
        ..message =
            e.message ?? 'The connection has timed out, Please try again!';
    } catch (e) {
      return ErrorEntity()
        ..success = 0
        ..message = e.toString();
    }
  }

  static Future<dynamic> uploadProfileFileWithToken(
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
      var multipartFile = await http.MultipartFile.fromPath("image", imagePath,
          contentType: MediaType('image', 'jpeg'));
      request.files.add(multipartFile);
      request.headers.addAll(headers);
      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse).timeout(
        const Duration(
          seconds: 45,
        ),
        onTimeout: () async {
          throw TimeoutException(
              'The connection has timed out, Please check your internet connection health and try again!');
        },
      );
      return _checkResponse(response);
    } on SocketException {
      return ErrorEntity()
        ..success = 0
        ..message = 'There is problem with the internet connection';
    } on TimeoutException catch (e) {
      return ErrorEntity()
        ..success = 0
        ..message =
            e.message ?? 'The connection has timed out, Please try again!';
    } catch (e) {
      return ErrorEntity()
        ..success = 0
        ..message = e.toString();
    }
  }

  static dynamic _checkResponse(http.Response response) {
    print(response.statusCode);
    switch (response.statusCode) {
      case 200:
        ErrorEntity normalEntity =
            ErrorEntity().fromJson(jsonDecode(response.body));
        if (normalEntity.success == 1 ||
            normalEntity.success == -1 ||
            normalEntity.success == -4 ||
            normalEntity.success == -5) {
          return jsonDecode(response.body);
        } else {
          print(response.body);
          return normalEntity;
        }
      case 400:
      case 401:
        return ErrorEntity()
          ..success = 401
          ..message = 'Bad Request';
      case 403:
        return ErrorEntity()
          ..success = 403
          ..message = 'Unauthorized request';
      case 404:
        return ErrorEntity()
          ..success = 404
          ..message = 'Page not found';
      case 500:
        return ErrorEntity()
          ..success = 500
          ..message = response.body;
      default:
        return ErrorEntity()
          ..success = 0
          ..message = 'Error occurred while communication with or timeout';
    }
  }
}
