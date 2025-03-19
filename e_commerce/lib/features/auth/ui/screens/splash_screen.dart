import 'package:e_commerce/app/app_configs.dart';
import 'package:e_commerce/app/assets_path.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/features/auth/ui/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../widgets/app_logo.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

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
  Future<void> _moveToNextScreen()async{
  await  Future.delayed(const Duration(seconds: 4),);
  Navigator.pushReplacementNamed(context, SignInScreen.name);
  }
}

