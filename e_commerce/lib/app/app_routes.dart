import 'package:e_commerce/features/auth/ui/screens/sign_in_screen.dart';
import 'package:e_commerce/features/auth/ui/screens/sign_up_screen.dart';
import 'package:e_commerce/features/common/controller/main_bottom_nav_bar_controller.dart';
import 'package:flutter/material.dart';
import '../features/auth/ui/screens/splash_screen.dart';
import '../features/auth/ui/screens/verify_otp_screen.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    late Widget route;

    if (settings.name == SplashScreen.name) {
      route = const SplashScreen();
    }
    else if(settings.name == SignInScreen.name){
      route = const SignInScreen();
    }
    else if(settings.name == SignUpScreen.name){
      route = const SignUpScreen();
    }
    else if(settings.name == VerifyOtpScreenOtp.name){
      route = const VerifyOtpScreenOtp();
    }
    else if(settings.name == MainBottomNavBarController.name){
      route = const MainBottomNavBarController();
    }

    return MaterialPageRoute(builder: (context) => route);
  }
}
