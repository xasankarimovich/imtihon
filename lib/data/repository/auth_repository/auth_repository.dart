import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:imtihon/data/model/user/user_model.dart';

class AuthHttpRepository {
  final String _apiKey = "AIzaSyBwfMiUYUoPeZ5-oSjAGWzFRttNwt5VAr";

  Future<Map<String, dynamic>> authenticate(
      {required UserModel userData}) async {
    print("object");

    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBbnZoRtdA8YikLImhvk99nBwQvvA-NStc");
    print("objecxt");

    try {
      final response = await http.post(
        url,
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
        print('Error: ${data['error']['message']}');
        throw (data['error']['message']);
      }

      print('Response: $data');
      return data;
    } catch (e) {
      print('Exception: $e');


      rethrow;
    }
  }
  Future<Map<String, dynamic>> getUserData() async {
    final response = await http.get(
        Uri.parse('https://imtihon-24fde-default-rtdb.firebaseio.com/User.json'));
    print('malumot chaqirilmoqda');
    if (response.statusCode == 200) {
      print('malumot keldi');
      final data = jsonDecode(response.body);
      debugPrint("repository data _________________________________________ ${data}");
      return data;
    } else {
      throw Exception('Failed to load user data');
    }
  }
}
