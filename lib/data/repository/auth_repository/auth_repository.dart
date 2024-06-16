import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:imtihon/data/model/user/user_model.dart';

class AuthHttpRepository {
  final String _apiKey = "AIzaSyBbnZoRtdA8YikLImhvk99nBwQvvA-NStc";

  Future<Map<String, dynamic>> register({required UserModel userData}) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_apiKey");

    try {
      final response = await http.post(
        url,
        body: jsonEncode({
          "email": userData.email,
          "password": userData.password,
          "returnSecureToken": true,
        }),
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

  Future<Map<String, dynamic>> login({required String email, required String password}) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_apiKey");

    try {
      final response = await http.post(
        url,
        body: jsonEncode({
          "email": email,
          "password": password,
          "returnSecureToken": true,
        }),
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

  Future<void> resetPassword({required String email}) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=$_apiKey");

    try {
      final response = await http.post(
        url,
        body: jsonEncode({
          "requestType": "PASSWORD_RESET",
          "email": email,
        }),
      );

      final data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw (data['error']['message']);
      }
    } catch (e) {
      rethrow;
    }
  }
}
