import 'package:e_commerce/features/auth/ui/screens/sign_in_screen.dart';
import 'package:e_commerce/features/auth/ui/screens/sign_up_screen.dart';
import 'package:e_commerce/features/common/ui/screen/main_bottom_nav_bar_screen.dart';
import 'package:e_commerce/features/products/ui/screen/create_review_screen.dart';
import 'package:e_commerce/features/products/ui/screen/product_details_screen.dart';
import 'package:e_commerce/features/products/ui/screen/products_list_screen.dart';
import 'package:e_commerce/features/products/ui/screen/reviews_screen.dart';
import 'package:e_commerce/features/wishlist/ui/screen/wish_list_screen.dart';
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
      final String email = settings.arguments.toString();
      route = VerifyOtpScreenOtp(email: email ,);
    }
    else if(settings.name == MainBottomNavBarScreen.name){
      route = const MainBottomNavBarScreen();
    }
    else if(settings.name == ProductsListScreen.name){
     final String category= settings.arguments as String;
      route =  ProductsListScreen(category: category,);
    }
    else if(settings.name == ProductDetailsScreen.name){
      route = const ProductDetailsScreen();
    }
    else if(settings.name == ReviewsScreen.name){
      route = const ReviewsScreen();
    }
    else if(settings.name == CreateReviewScreen.name){
      route = const CreateReviewScreen();
    }

    return MaterialPageRoute(builder: (context) => route);
  }
}
