import 'package:e_commerce/app/app_configs.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/features/auth/ui/controllers/auth_controllers.dart';
import 'package:e_commerce/features/auth/ui/screens/sign_in_screen.dart';
import 'package:e_commerce/features/common/ui/screen/main_bottom_nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:  SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(),
             const AppLogo(),
              const Spacer(),
              const CircularProgressIndicator(),
              const SizedBox(height: 16),
              Text(
                  '${context.localizations.version} ${AppConfigs.currentAppVersion}')
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 4));
    bool userLoggedIn = await authController.isUserLoggedIn();
    if (userLoggedIn) {
      Get.offNamed( MainBottomNavBarScreen.name);
    } else {
      Get.offNamed(SignInScreen.name);
    }
  }


}

