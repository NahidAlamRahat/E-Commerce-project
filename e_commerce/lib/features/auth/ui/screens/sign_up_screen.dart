import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:e_commerce/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../widgets/sign_in_rich_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static String name = 'sign-up-screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 36),
              const AppLogo(),
              const SizedBox(height: 16),
              Text(
                context.localizations.completeProfile,
                style: textTheme.titleLarge,
              ),
              Text(
                context.localizations.getStartedWithDetails,
                style: textTheme.titleSmall,
              ),
              _buildForm(context),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _onTapSignUpButton,
                child: Text(context.localizations.complete),
              ),
              const SizedBox(height: 12),
               SignInRichText(voidCallback: () => _onTapSignInButton(),
               )
            ],
          ),
        ),
      ),
    );
  }
  void _onTapSignInButton() {
    Navigator.pop(context);
  }
  Widget _buildForm(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const SizedBox(height: 24),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: context.localizations.firstName,
            ),
          ),
          const SizedBox(height: 12),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: context.localizations.lastName,
            ),
          ),
          const SizedBox(height: 12),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: context.localizations.mobile,
            ),
          ),
          const SizedBox(height: 12),
          TextFormField(
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: context.localizations.city,
            ),
          ),
          const SizedBox(height: 12),
          TextFormField(
            maxLines: 3,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              hintText: context.localizations.shippingAddress,
            ),
          ),
        ],
      ),
    );
  }



  void _onTapSignUpButton() {
Navigator.pushNamed(context, VerifyOtpScreenOtp.name);
  }

}
