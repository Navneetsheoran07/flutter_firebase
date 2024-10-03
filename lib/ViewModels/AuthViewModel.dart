import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Model/UserModel.dart';
import '../Service/AuthService.dart';


// class AuthViewModel extends ChangeNotifier {
//   final AuthService _authService = AuthService();
//   User? _user;
//   String? _verificationId;
//
//
//   Future<void> signIn(String email, String password) async {
//     _user = await _authService.signInWithEmailAndPassword(email, password);
//     if (_user != null) {
//       Fluttertoast.showToast(msg: "Sign In Successful");
//     } else {
//       Fluttertoast.showToast(msg: "Sign In Failed");
//     }
//     notifyListeners();
//   }
//
//   Future<void> register(String email, String password) async {
//     _user = await _authService.registerWithEmailAndPassword(email, password);
//     if (_user != null) {
//       Fluttertoast.showToast(msg: "Registration Successful");
//     } else {
//       Fluttertoast.showToast(msg: "Registration Failed");
//     }
//     notifyListeners();
//   }
//
//   Future<void> verifyPhoneNumber(String phoneNumber) async {
//     await _authService.verifyPhoneNumber(phoneNumber, (verificationId) {
//       _verificationId = verificationId;
//       Fluttertoast.showToast(
//         msg: "OTP has been sent!",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.green,
//         textColor: Colors.white,
//         fontSize: 16.0,
//       );
//       notifyListeners();
//     });
//   }
//
//   Future<void> signInWithOtp(String smsCode) async {
//     if (_verificationId != null) {
//       _user = await _authService.signInWithOtp(_verificationId!, smsCode);
//       if (_user != null) {
//         Fluttertoast.showToast(
//           msg: "Phone number verified successfully!",
//           toastLength: Toast.LENGTH_SHORT,
//           gravity: ToastGravity.BOTTOM,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.green,
//           textColor: Colors.white,
//           fontSize: 16.0,
//         );
//         notifyListeners();
//       } else {
//         Fluttertoast.showToast(msg: "Sign In Failed");
//       }
//       notifyListeners();
//     }
//   }
//
//   // google sign in
//
//
//
//
//
//   Future<void> signOut() async {
//     await _authService.signOut();
//
//     _user = null;
//     Fluttertoast.showToast(msg: "Signed Out");
//     notifyListeners();
//   }
//
// //Google sign in
//
//
//
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class AuthViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  UserModel? _user;

  UserModel? get user => _user;

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      final User? firebaseUser = userCredential.user;

      _user = UserModel(
        uid: firebaseUser!.uid,
        email: firebaseUser.email!,
        displayName: firebaseUser.displayName!,
        photoUrl: firebaseUser.photoURL!,
      );

      notifyListeners();

      // Show toast message
      Fluttertoast.showToast(
        msg: "Login Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      // Navigate to HomeScreen
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      print(e);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    _user = null;
    notifyListeners();
  }
}
