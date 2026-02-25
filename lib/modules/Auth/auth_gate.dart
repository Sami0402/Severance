import 'package:e_commerce_app/modules/Home/home_screen.dart';
import 'package:e_commerce_app/modules/onboard/onboard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, userSnapshot) {
        if (userSnapshot.connectionState == ConnectionState.waiting){
          return Scaffold(
            body: Center(child: 
            CircularProgressIndicator(),),
          );
        }
        if (userSnapshot.hasData) {
          return HomeScreen();
        } else {
          return OnboardScreen();
        }
      },
    );
  }
}