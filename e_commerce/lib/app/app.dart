import 'package:e_commerce/app/app_colors.dart';
import 'package:e_commerce/app/app_routes.dart';
import 'package:e_commerce/app/controller_binders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

class CraftyBay extends StatefulWidget {
  const CraftyBay({super.key});

  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      initialBinding: ControllerBinders(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    theme: ThemeData(
      colorSchemeSeed: AppColors.themeColor,

      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        hintStyle:
        const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.themeColor),
        ),
        focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.themeColor),
         ),
        focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.themeColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          fixedSize: const Size(double.maxFinite, 16),
          textStyle: const TextStyle(color: Colors.white),
        ),
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.white,

      textTheme: const TextTheme(
      titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 30),

        titleSmall: TextStyle(
         color: Colors.grey
        )
     ),



    ),


      localizationsDelegates:  const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale:  const Locale('en'),
      supportedLocales: const [
        Locale('en'), // English
        Locale('bn'),
      ],


    );

  }
}
