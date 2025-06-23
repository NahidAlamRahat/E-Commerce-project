import 'package:e_commerce/app/assets_path.dart';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/features/auth/ui/screens/sign_up_screen.dart';
import 'package:e_commerce/features/auth/ui/widgets/app_logo.dart';
import 'package:e_commerce/features/common/ui/screen/main_bottom_nav_bar_screen.dart';
import 'package:e_commerce/features/auth/ui/widgets/double_click_to_exit_app_method.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';
import '../../../../core/services/firebase_network_caller.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static String name = 'signIn-screen';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final bool _isGoogleLoading = false;
  late bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return WillPopScope(
      onWillPop: () => onWillPop(context: context),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 60),
                AppLogo(),
                const SizedBox(height: 24),
                Text(context.localizations.welcomeBack,
                    style: textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(context.localizations.enterYorEmailAndPass,
                    style: textTheme.titleSmall),
                const SizedBox(height: 24),
                _buildForm(context),
                const SizedBox(height: 12),
                ElevatedButton(
                    onPressed: () {
                      // Navigator.pushReplacementNamed(context, MainBottomNavBarScreen.name);
                      if (_formKey.currentState!.validate()) {
                        FirebaseNetworkCaller.handleEmailSignIn(
                          email: _emailTEController.text.trim(),
                          password: _passwordTEController.text.trim(),
                          context: context,
                        );
                      }
                    },
                    child: Text(context.localizations.signIn)),
                const SizedBox(height: 12),
                buildRichText(),
                const SizedBox(
                  height: 16,
                ),
                _buildGoogleSignInButton(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGoogleSignInButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        FirebaseNetworkCaller.loginWithGoogle(context: context);
        setState(() {});
      },
      icon: _isGoogleLoading
          ? const SizedBox(
              height: 24,
              width: 24,
              child: CircularProgressIndicator(
                color: Colors.black,
                strokeWidth: 2,
              ),
            )
          : Image.asset(AssetsPath.googleIcon, height: 40),
      label: const Text(
        'Sign in with Google',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(double.infinity, 50),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return context.localizations.enterYourEmail;
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            controller: _emailTEController,
            decoration: InputDecoration(hintText: context.localizations.email),
          ),
          const SizedBox(height: 12),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return context.localizations.enterYourPassword;
              }
              return null;
            },
            controller: _passwordTEController,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              hintText: context.localizations.password,
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRichText() {
    return RichText(
      text: TextSpan(
        text: context.localizations.donTHaveAnAccount,
        style: TextStyle(
          color: AppColors.blackColor,
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(
            text: ' ${context.localizations.signUp}',
            style: TextStyle(
              color: AppColors.themeColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, SignUpScreen.name);
              },
          ),
        ],
      ),
    );
  }
}
