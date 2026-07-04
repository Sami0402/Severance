import 'package:shared_preferences/shared_preferences.dart';

class UserPrefrences {
  static SharedPreferences? _prefs;

  static String? firstName;
  static String? lastName;
  static String? username;
  static String? email;
}