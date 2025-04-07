import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/features/auth/ui/screens/sign_up_screen.dart';
import 'package:e_commerce/features/auth/ui/widgets/app_logo.dart';
import 'package:e_commerce/features/common/ui/screen/main_bottom_nav_bar_screen.dart';
import 'package:e_commerce/features/common/ui/widgets/double_click_to_exit_app_method.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';

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
                      Navigator.pushReplacementNamed(context, MainBottomNavBarScreen.name);
                    },
                    child: Text(context.localizations.signIn)),
                const SizedBox(height: 12),
                buildRichText()
              ],
            ),
          ),
        ),
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
            controller: _passwordTEController,
            decoration:
                InputDecoration(hintText: context.localizations.password),
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
