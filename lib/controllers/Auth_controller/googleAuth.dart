import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class googleAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  Future<User?> signInWithGoogle() async {
    try {
      // Initialize
      await _googleSignIn.initialize(
        serverClientId: "260406970172-k7tv9bg4trhrpng07u44htdtnskgvpg8.apps.googleusercontent.com",
      );

      // start sign in
      final GoogleSignInAccount? account = await _googleSignIn.authenticate();

      // Get Tokens
      final GoogleSignInAuthentication googleAuth = 
        await account!.authentication;

      // Create Firebase Credentials
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // Sign In to Firebase
      final UserCredential = await _auth.signInWithCredential(credential);
      return UserCredential.user;
    }
    catch(e){
      print('Google Sign-In Error: $e');
      return null;
    }
  }
}