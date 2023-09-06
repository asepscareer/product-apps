import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:product_apps/const/constanta.dart';

import 'package:product_apps/models/user_info.dart';

class LoginResponse {
  Future<String?> validate(String username, String password) async {
    try {
      final url = Uri.parse(ApiConstants.loginUrl);
      final response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "username": username,
            "password": password,
          }));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final result = UserInfo.fromJson(jsonData);

        String token = result.token;
        Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
        print(decodedToken["email"]);

        return token;
      } else {
        print("Failed to fetch data. Status code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
