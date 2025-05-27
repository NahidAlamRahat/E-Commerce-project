import 'package:e_commerce/app/app_color.dart';
import 'package:e_commerce/app/app_config.dart';
import 'package:e_commerce/core/extensions/app_localization_extension.dart';
import 'package:e_commerce/feature/auth/ui/controller/auth_controller.dart';
import 'package:e_commerce/feature/auth/ui/widgets/app_logo.dart';
import 'package:e_commerce/feature/common/screens/main_botton_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveNextScreen();
  }

  Future<void> _moveNextScreen() async {
    await Future.delayed(Duration(seconds: 3));
    await Get.find<AuthController>().getUserData();
    Navigator.pushReplacementNamed(context, MainBottomNavScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Spacer(),
              AppLogo(),
              Spacer(),
              CircularProgressIndicator(color: AppColors.themeColor),
              const SizedBox(height: 16),
              Text(
                '${context.localizations.version}: ${AppConfigs.currentAppVersion}',
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
