import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:e_commerce/features/auth/ui/widgets/app_logo.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../widgets/sign_in_rich_text.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static String name = 'sign-up-screen';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailTEController = TextEditingController();
  TextEditingController passwordTEController = TextEditingController();
  TextEditingController firstNameTEController = TextEditingController();
  TextEditingController lastNameTEController = TextEditingController();
  TextEditingController mobileTEController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();


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
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 24),

          TextFormField(
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: context.localizations.firstName,
            ),

            validator: (String? value) {
              if(value?.trim().isEmpty ?? true){
                return context.localizations.enterYourFirstName ;
              }
              return null;
            },
          ),

          const SizedBox(height: 12),

          TextFormField(
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: context.localizations.lastName,
            ),
            validator: (String? value) {
              if(value?.trim().isEmpty?? true){
                return context.localizations.enterYourLastName;
              }
              return null;
            },
          ),

          const SizedBox(height: 12),

          TextFormField(
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: context.localizations.email,
            ),
            validator: (value) {
              String email = value ?? '';
              if(!EmailValidator.validate(email)) {
                return context.localizations.enterValidEmail;
              }

              return null;
            },
          ),

          const SizedBox(height: 12),

          TextFormField(
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: context.localizations.mobile,
            ),
            validator: (value) {
              String phoneNumber= value?? '' ;
              RegExp regExp = RegExp(r'^(?:\+88)?01[0-9]{9}$');
              if(regExp.hasMatch(phoneNumber) == false){
                return context.localizations.enterYourValidMobileNumber;
              }
              return null;
            },

          ),

          const SizedBox(height: 12),

          TextFormField(
            maxLines: 3,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: context.localizations.shippingAddress,
            ),
            validator: (value) {
              if(value?.trim().isEmpty ?? true){
               return context.localizations.enterAShippingAddress;
              }
              return null;
            },
          ),

          const SizedBox(height: 12),

          TextFormField(
            validator: (String? value) {
              if (value?.trim().isEmpty ?? true) {
                return context.localizations.enterAPassword;
              }
              if (value!.length < 6) {
               return context.localizations.enterPasswordMoreThan6Letters;
              }
              return null;
            },
            controller: passwordTEController,
            decoration:  InputDecoration(hintText: context.localizations.password),
          ),
        ],
      ),
    );
  }



  void _onTapSignUpButton() {
    if(formKey.currentState!.validate()){
      Navigator.pushNamed(context, VerifyOtpScreenOtp.name);

    }
  }

}
