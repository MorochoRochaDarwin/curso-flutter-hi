import 'dart:convert';

import 'package:meta/meta.dart' show required;
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import '../constants.dart';

class AccountApi {
  static Future<dynamic> login(
      {@required String email, @required String password}) async {
    try {
      final headers = {'Content-Type': 'application/json'};

      final data = {"email": email, "password": password};

      final response = await http.post("$API_HOST/login",
          body: jsonEncode(data), headers: headers);
      final statusCode = response.statusCode;

      final decoded = jsonDecode(response.body);

      if (statusCode == 200) {
        print(response.body);
        return decoded;
      } else {
        throw new PlatformException(
            code: statusCode.toString(), message: decoded["message"]);
      }
    } on PlatformException catch (e) {
      print("${e.code}");
      print("${e.message}");
      return null;
    }
  }

  static Future<dynamic> register(
      {@required String name,
      @required String email,
      @required String password}) async {
    try {
      final headers = {'Content-Type': 'application/json'};

      final data = {"name": name, "email": email, "password": password};

      final response = await http.post("$API_HOST/register",
          body: jsonEncode(data), headers: headers);
      final statusCode = response.statusCode;

      final decoded = jsonDecode(response.body);

      if (statusCode == 200) {
        print(response.body);
        return decoded;
      } else {
        throw new PlatformException(
            code: statusCode.toString(), message: decoded["message"]);
      }
    } on PlatformException catch (e) {
      print("${e.code}");
      print("${e.message}");
      return null;
    }
  }
}
