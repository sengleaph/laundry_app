import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../handle_error/app_exception.dart';

class NetworkApiService {
  dynamic responseJson;

  // Future<Map<String, dynamic>> PostApiResponse(String url, GetDataLoginModel data) async {
  //   var headers = {
  //     'api-key': '00wog8gkskkk4wwoc8w0goo40804c00wc40go84w',
  //     'Cookie': 'bpas_cart_id=75157c4ffa3b999bb07dfb3566d647fa'
  //   };
  //
  //   var request = http.MultipartRequest(
  //       'POST',
  //       Uri.parse(url));
  //
  //   request.fields.addAll({'user_id': data.data!.id!});
  //
  //   request.headers.addAll(headers);
  //
  //   try {
  //     var response = await request.send();
  //
  //     if (response.statusCode == 200) {
  //       var responseBody = await response.stream.bytesToString();
  //       var jsonData = json.decode(responseBody);
  //       return jsonData;
  //     } else {
  //       throw Exception('Failed to load profile data');
  //     }
  //   } catch (e) {
  //     throw Exception('Failed to load profile data: $e');
  //   }
  // }
  //============================================================================
  // static Future<String> changePassword(ChangePasswordModel model) async {
  //   var headers = {
  //     'api-key': AppUrl.authApiKey,
  //     'Cookie': 'bpas_cart_id=75157c4ffa3b999bb07dfb3566d647fa; bpas_token_cookie=0a13fdc8f42e232fe9d267e1bff7d0b8; sess=qh0ulmnbq45rn7p17m32kvd4ja0d2jia'
  //   };
  //
  //   var request = http.MultipartRequest('POST', Uri.parse(AppUrl.changePassword));
  //   request.fields.addAll({
  //     'oldpassword': model.oldPassword,
  //     'password': model.newPassword,
  //     'confirm_password': model.confirmPassword,
  //     'user_id': model.userId,
  //   });
  //
  //   request.headers.addAll(headers);
  //
  //   try {
  //     http.StreamedResponse response = await request.send();
  //
  //     if (response.statusCode == 200) {
  //       String responseString = await response.stream.bytesToString();
  //       print('Response: $responseString');
  //       return 'Password changed successfully!';
  //     } else {
  //       String responseString = await response.stream.bytesToString();
  //       print("Response Body: $responseString");
  //       print("Reason Phrase: ${response.reasonPhrase}");
  //       print("Status Code: ${response.statusCode}");
  //       return 'Failed to change password: ${response.reasonPhrase}';
  //     }
  //   } catch (e) {
  //     print("Exception: $e");
  //     return 'Failed to change password: An unexpected error occurred';
  //   }
  // }
  //============================================================================
  //fetch API
  // @override
  // Future<dynamic> getApiResponse(String url) async {
  //   var headers = {
  //     'api-key': '00wog8gkskkk4wwoc8w0goo40804c00wc40go84w',
  //     'Cookie':
  //         'bpas_cart_id=75157c4ffa3b999bb07dfb3566d647fa; bpas_token_cookie=8c63b6436a709310f29626a3bebf4b96; sess=r1n73ll9gnmb1e9nneri1g83p489n9jm'
  //   };
  //   try {
  //     var response = await http.get(Uri.parse(url), headers: headers);
  //     return returnResponse(response);
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  // }
  //============================================================================

  // Future<dynamic> getApiLeaveType(String url) async {
  //   var headers = {
  //     'api-key': '00wog8gkskkk4wwoc8w0goo40804c00wc40go84w',
  //     'Cookie': 'bpas_token_cookie=ded21adac64d83645cd2da5236498ec5; sess=mrrdrop7oh0r2h60s5pk9e79poj25of8'
  //   };
  //   try {
  //     var response = await http.get(Uri.parse(url), headers: headers);
  //     return returnResponse(response);
  //   } on SocketException {
  //     throw FetchDataException('No Internet connection');
  //   }
  // }
  //post image
  // Future<dynamic> uploadImageService(url, file) async {
  //   var request = http.Request('GET', Uri.parse(url));
  //
  //   http.StreamedResponse response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //     print(response.isRedirect.toString());
  //     print(await response.stream.bytesToString());
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  // }
//==============================================================================
//   Future<Map<String, dynamic>> postApi(
//       String url, Map<String, dynamic> requestBody) async {
//     var headers = {
//       'api-key': '00wog8gkskkk4wwoc8w0goo40804c00wc40go84w',
//       'Cookie':
//           'bpas_cart_id=75157c4ffa3b999bb07dfb3566d647fa; sess=n1abnj5f8n8ple68t4jpuhskhfbe5i09',
//       'Content-Type': 'application/json',
//     };
//
//     var request = http.Request('POST', Uri.parse(url));
//     request.body = jsonEncode(requestBody);
//     request.headers.addAll(headers);
//
//     http.StreamedResponse response = await request.send();
//
//     if (response.statusCode == 200) {
//       String responseString = await response.stream.bytesToString();
//       return jsonDecode(responseString); // Return the parsed JSON response
//     } else {
//       print('Error: ${response.statusCode} - ${response.reasonPhrase}');
//       print('Headers: ${response.headers}');
//       print('Request URL: $url');
//       print('Request Body: $requestBody');
//       return {'status': false, 'message': 'Failed to submit', 'data': false};
//     }
//   }
//=============================fetch current shift ===========================
//   Future<Map<String, dynamic>> fetchCurrentShift(String url, String userId) async {
//     var headers = {
//       'api-key': '00wog8gkskkk4wwoc8w0goo40804c00wc40go84w',
//       'Cookie':
//       'bpas_cart_id=75157c4ffa3b999bb07dfb3566d647fa; sess=n1abnj5f8n8ple68t4jpuhskhfbe5i09',
//       'Content-Type': 'application/json',
//     };
//
//     var request = http.MultipartRequest('POST', Uri.parse(url));
//     request.fields.addAll({'user_id': userId});
//     request.headers.addAll(headers);
//
//     http.StreamedResponse response = await request.send();
//
//     if (response.statusCode == 200) {
//       return jsonDecode(await response.stream.bytesToString());
//     } else {
//       throw Exception('Failed to fetch current shift: ${response.reasonPhrase}');
//     }
//   }
  //==================================multipartPostApi==========================
  // Future<Map<String, dynamic>> multipartPostApi(String url, Map<String, String> fields, Map<String, String> headers) async {
  //   var request = http.MultipartRequest('POST', Uri.parse(url));
  //   request.fields.addAll(fields);
  //   request.headers.addAll(headers);
  //
  //   http.StreamedResponse response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //     return jsonDecode(await response.stream.bytesToString());
  //   } else {
  //     throw Exception('Failed to load data: ${response.reasonPhrase}');
  //   }
  // }

//==============================================================================
// Auth api provider mvvm

  // Future<AuthModel> login(UserCredentials credentials) async {
  //   return _authRepository.login(credentials);
  // }

  // ===========================================================================

  returnResponse(http.Response response) {
    if (kDebugMode) {
      print(response.statusCode);
    }

    switch (response.statusCode) {
      case 200:
        // dynamic responseJson = jsonDecode(response.body);
        print('json.decode ${json.decode(response.body)}');
        return json.decode(response.body);
      // return responseJson ;
      case 400:
        print('error is on: ${response.body.toString()}');
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while communicating with server');
    }
  }
}
