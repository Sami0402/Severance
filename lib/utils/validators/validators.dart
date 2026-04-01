

import 'package:get/get.dart';

class Validators {
  
  
  
  // FIRST NAME
  static String? firstName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'First Name is required';
    }
    if (value.length < 3) {
      return 'Name must be at least 3 charachters';
    }
    return null;
  }

  // Last NAME
  static String? lastName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Last Name is required';
    }
    if (value.length < 3) {
      return 'Name must be at least 3 charachters';
    }
    return null;
  }

  // USERNAME
  static String? username(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    return null;
  }

  // EMAIL
  static String? email(String? value, {String? message}) { 
    

    if (value == null || value.isEmpty) {
      return 'Email is required';
    } 
    // else if(error.value == "User already exist"){
    //   return "User already exist";
    // }
    return null;
  }

  // SIGN UP PASSWORD
  static String? signUpPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? signInPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }
}
