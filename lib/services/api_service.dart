import 'dart:convert';
import 'package:e_commerce_app/utils/constants/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  
  // LOGIN
  static Future<Map<String, dynamic>> loginUser(
    String email,
    String password,
  ) async {
    

    final url = Uri.parse("${ApiConstants.baseUrl}/login"); 

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );
    print(response.statusCode);
    print(response.body);
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

    
    final url = Uri.parse("${ApiConstants.baseUrl}/register");


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

    final url = Uri.parse("${ApiConstants.baseUrl}/Shoes");


    final response = await http.get(url);

    if(response.statusCode == 200){
      return jsonDecode(response.body);     
    } else if (response.statusCode == 500){ 
      throw Exception(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load Shoes");
    }

  }

  // Toggle Wishlist 
  static Future<Map<String, dynamic>> toggleLike(int shoeId) async{


    final url = Uri.parse("${ApiConstants.baseUrl}/wishlist/toggle/$shoeId");



    final prefs = await SharedPreferences.getInstance();

    final id = prefs.getString("id");
    final token = prefs.getString("token");

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${token!}",
        "user": id!,
      },  
      );
    return jsonDecode(response.body);
  }

  // GET Wishlist 
  static Future<Map<String, dynamic>> getWishlist() async{

    final url = Uri.parse("${ApiConstants.baseUrl}/wishlist");


    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString("token");

    final response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer ${token!}",
      }
    );

    return jsonDecode(response.body);
  }

  // ADD TO CART
  static Future<Map<String, dynamic>> addToCart(int shoeId, String selectedSize) async{

    final url = Uri.parse("${ApiConstants.baseUrl}/addToCart/$shoeId");


    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString("token");
    
    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${token!}",
      },
      body: json.encode({
        "selectedSize": selectedSize,
      }),
      );

  return jsonDecode(response.body);
  }

  // GET CART ITEMS
  static Future<Map<String, dynamic>> getCartItems() async{

    // RENDER
    final url = Uri.parse("${ApiConstants.baseUrl}/cart");


    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString("token");
    
    final response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${token!}",
      },
      );
  return jsonDecode(response.body);
  }

  // DELETE CART ITEM
  static Future<Map<String, dynamic>> deleteCartItem(int shoeId, String selectedSize) async{

    final url = Uri.parse("${ApiConstants.baseUrl}/cart/$shoeId");


    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString("token");

    final response = await http.delete(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${token!}",
      },
      body: jsonEncode( {
        "selectedSize": selectedSize
      }),
      );

    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> updateCartItem(int shoeId , String selectedSize, String action) async{

    final url = Uri.parse("${ApiConstants.baseUrl}/cart/$shoeId");


    final prefs = await SharedPreferences.getInstance();

    final token = prefs.getString("token");

    final response = await http.patch(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${token!}",
      },
      body: jsonEncode({
         "selectedSize" : selectedSize,
        "action" : action
      })
      );

      return jsonDecode(response.body);
  }
}
