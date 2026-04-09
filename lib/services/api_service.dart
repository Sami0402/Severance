import 'dart:convert';

import 'package:http/http.dart' as http;

class apiService {
  // LOGIN
  static Future<Map<String, dynamic>> loginUser(
    String email,
    String password,
  ) async {
    // WORKS FOR ANDROID EMULATOR
    // final url = Uri.parse("http://10.0.2.2:3000/login");

    // WORKS FOR REAL DEVICE 
    final url = Uri.parse("http://192.168.1.9:3000/login");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );
    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> registerUser(
    String firstName,
    String lastName,
    String username,
    String email,
    String password,
  ) async {
    final url = Uri.parse("http://10.0.2.2:3000/register");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "firstName": firstName,
        "lastName": lastName,
        "username": username,
        "email": email,
        "password": password,
      }),
    );

    return jsonDecode(response.body);
   
  }
}
