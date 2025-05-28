import 'package:e_commerce/app/app_color.dart';
import 'package:e_commerce/core/extensions/app_localization_extension.dart';
import 'package:e_commerce/core/widgets/show_snack_Bar.dart';
import 'package:e_commerce/feature/auth/data/model/sign_in_request_model.dart';
import 'package:e_commerce/feature/auth/ui/screens/sign_up_screen.dart';
import 'package:e_commerce/feature/auth/ui/widgets/app_logo.dart';
import 'package:e_commerce/feature/common/screens/main_botton_nav_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/sign_in_controller.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static String name = '/signIn';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passTEController = TextEditingController();
  SignInController signInController = Get.find<SignInController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0, forceMaterialTransparency: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Form(
            key: _fromKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                SizedBox(height: 100),
                AppLogo(),
                SizedBox(height: 16),
                Text(
                  context.localizations.welcomeback,
                  style: context.textTheme.titleLarge,
                ),
                Text(
                  context.localizations.plzEnterEmailPass,
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                SizedBox(height: 14),
                TextFormField(
                  controller: _emailTEController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: context.localizations.email,
                  ),
                  validator: (value) {
                    String email = value ?? '';
                    RegExp regExp = RegExp(
                      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
                    );
                    if (regExp.hasMatch(email) == false) {
                      return 'Enter your valid email';
                    }
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 14),
                TextFormField(
                  controller: _passTEController,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: context.localizations.password,
                  ),
                  validator: (value) {
                    if ((value?.isEmpty ?? true) || value!.length < 6) {
                      return 'Enter a password more than 6 letters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                GetBuilder<SignInController>(
                  builder: (controller) {
                    return controller.inProgress == true
                        ? Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                          onPressed: _onTapSignInButton,
                          child: Text(
                            context.localizations.signIn,
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                  },
                ),
                SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    text: context.localizations.doNotHaveAccount,
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                        text: context.localizations.signUp,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.themeColor,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, SignUpScreen.name);
                              },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Future <void> _onTapSignInButton()async {
    if(_fromKey.currentState!.validate()){

      SignInRequestModel signInRequestModel = SignInRequestModel(
          email: _emailTEController.text.trim(), password: _passTEController.text);
      final bool isSuccess = await signInController.signIn(signInRequestModel);

      if(isSuccess){
        Navigator.pushNamedAndRemoveUntil(context,MainBottomNavScreen.name , (route) => false,) ;
      }
      else{
        showSnackBarMessage(context, signInController.errorMsg, true);
      }

    }


  }


}
