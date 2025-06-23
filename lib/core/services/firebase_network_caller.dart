import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../features/auth/ui/screens/sign_in_screen.dart';
import '../../features/auth/ui/screens/verify_otp_screen.dart';
import '../../features/common/ui/screen/main_bottom_nav_bar_screen.dart';

class FirebaseNetworkCaller {
  static var userData = FirebaseAuth.instance.currentUser;


  /// Logs in user using Google Sign-In and navigates to main screen.
  static Future<dynamic> loginWithGoogle(
      {required BuildContext context}) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      debugPrint('token => ${googleAuth?.accessToken}');

      var userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Save user
      FirebaseNetworkCaller.userData = userCredential.user;

      debugPrint('Email => ${FirebaseNetworkCaller.userData?.email}');
      debugPrint('Login success');

      if (FirebaseNetworkCaller.userData != null) {
        debugPrint('User email: ${FirebaseNetworkCaller.userData?.email}');
        debugPrint('User name: ${FirebaseNetworkCaller.userData?.displayName}');
        debugPrint('Photo URL: ${FirebaseNetworkCaller.userData?.photoURL}');
      } else {
        debugPrint('User is null!');
      }

      Navigator.pushNamedAndRemoveUntil(
          context, MainBottomNavBarScreen.name, (route) => false);
    } catch (e) {
      debugPrint('Google Sign-In error: $e');
    }
    return null;
  }


  /// Signs in user with email and password,
  static Future<void> handleEmailSignIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      userData = userCredential.user;

      debugPrint('Email => ${userData?.email}');
      debugPrint('Login success');

      Navigator.pushNamedAndRemoveUntil(
          context, MainBottomNavBarScreen.name, (route) => false);
    } on FirebaseAuthException catch (e) {
      debugPrint('FirebaseAuthException code: ${e.code}');

      String errorMessage = 'Sign in failed.';

      if (e.code == 'user-not-found') {
        errorMessage = 'No account has been created with this email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Your password is incorrect.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'The email address is badly formatted.';
      } else if (e.code == 'user-disabled') {
        errorMessage = 'This user account has been disabled.';
      } else if (e.code == 'invalid-credential') {
        errorMessage = 'Invalid email or password.';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } catch (e) {
      debugPrint('Unknown sign-in error: ${e.toString()}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign in failed: ${e.toString()}')),
      );
    }
  }



  /// Creates a new user account using email and password.
  static Future<void> handleEmailSignUp({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      userData = userCredential.user;

      // Email verification পাঠানো
      if (userData != null && !userData!.emailVerified) {
        await userData!.sendEmailVerification();
        debugPrint('Verification email sent to ${userData!.email}');

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('A verification email has been sent.')),
        );
      }

      Navigator.pushNamed(context, VerifyOtpScreenOtp.name);
    } on FirebaseAuthException catch (e) {
      String errorMessage = 'Sign up failed';
      if (e.code == 'email-already-in-use') {
        errorMessage = 'This email is already in use.';
      } else if (e.code == 'weak-password') {
        errorMessage = 'The password is too weak.';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign up error: ${e.toString()}')),
      );
    }
  }



  /// Logs out user and navigates to sign-in screen.
  static Future<void> signOut({required BuildContext context}) async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
    userData = null;

    Navigator.pushNamedAndRemoveUntil(
      context,
      SignInScreen.name,
      (route) => true,
    );
  }
}
