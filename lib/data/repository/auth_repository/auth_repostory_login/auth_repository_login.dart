import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:imtihon/data/model/user/user_model.dart';

class AuthHttpRepository {
  final String _apiKey = "AIzaSyBwfMiUYUoPeZ5-oSjAGWzFRttNwt5VArU";

  Future<Map<String, dynamic>> authenticate(
      {required UserModel userData}) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_apiKey");

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
          {
            "email": userData.email,
            "password": userData.password,
            "returnSecureToken": true,
          },
        ),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw (data['error']['message']);
      }

      return data;
    } catch (e) {
      rethrow;
    }
  }
}
