import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  
  // LOGIN
  static Future<Map<String, dynamic>> loginUser(
    String email,
    String password,
  ) async {
    
    // WORKS FOR REAL DEVICE 
    // final url = Uri.parse("http://10.0.2.2:3000/login");
    
    // WORKS FOR ANDROID EMULATOR
    final url = Uri.parse("http://192.168.1.100:3000/login");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );
    return jsonDecode(response.body);
  }

  // REGISTER
  static Future<Map<String, dynamic>> registerUser(
    String firstName,
    String lastName,
    String username,
    String email,
    String password,
  ) async {
    // WORKS FOR ANDROID EMULATOR
    // final url = Uri.parse("http://10.0.2.2:3000/register");

    // WORKS FOR REAL DEVICE 
    final url = Uri.parse("192.168.1.100:3000/register");

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

  // FETCH SHOES
  static Future<Map<String, dynamic>> getAllShoes() async{
    // WORKS FOR ANDROID EMULATOR
    // final url = Uri.parse("http://10.0.2.2:3000/Shoes");

    // WORKS FOR REAL DEVICE 
    final url = Uri.parse("http://192.168.1.100:3000/Shoes");

    final response = await http.get(url);

    if(response.statusCode == 200){
      return jsonDecode(response.body);     
    } else if (response.statusCode == 500){ 
      throw Exception(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load Shoes");
    }

  }

}
