import 'package:e_commerce_app/controllers/Auth_controller/auth_controller.dart';
import 'package:e_commerce_app/modules/Auth/login_screen.dart';
import 'package:e_commerce_app/modules/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



// class AuthGate extends StatelessWidget {
//   const AuthGate({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final AuthController authController = Get.find<AuthController>();
//     return StreamBuilder(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, userSnapshot) {
//           if (userSnapshot.connectionState == ConnectionState.waiting){
//             return Scaffold(
//               body: Center(child: 
//               CircularProgressIndicator(),),
//             );
//           }
         
//           if (userSnapshot.hasData) { 
//             // authController.loadUserData(); 
//             return  Obx((){
//               if(true){
//                return Scaffold(
//                  body: Center(
//                   child: CircularProgressIndicator(),
//                                ),
//                );
//               }else{
//               return HomeScreen();
//               } 
//           });
            
                
//           } else {
//             return LoginScreen();
//           }
//         },
//       );
    
//   }
// }