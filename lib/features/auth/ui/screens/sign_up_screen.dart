import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/features/auth/data/models/sign_up_model.dart';
import 'package:e_commerce/features/auth/ui/controllers/sign_up_controller.dart';
import 'package:e_commerce/features/auth/ui/screens/verify_otp_screen.dart';
import 'package:e_commerce/features/auth/ui/widgets/app_logo.dart';
import 'package:e_commerce/features/auth/ui/widgets/show_snack_bar_message.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../../core/services/firebase_network_caller.dart';
import '../widgets/sign_in_rich_text.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static String name = 'sign-up-screen';

  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  TextEditingController firstNameTEController = TextEditingController();
  TextEditingController lastNameTEController = TextEditingController();
  TextEditingController mobileTEController = TextEditingController();
  TextEditingController cityTEController = TextEditingController();
  late bool _obscurePassword = true;



  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final SignUpController signUpController = Get.find<SignUpController>();


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
              GetBuilder<SignUpController>(
                builder: (controller) {
                  return Visibility(
                    visible: controller.signUpInProgress == false,
                    replacement: CircularProgressIndicator(),
                    child: ElevatedButton(
                      onPressed: (){
                        // onTapSignUpButton();

                        FirebaseNetworkCaller.handleEmailSignUp(
                            email: _emailTEController.text.trim(),
                            password: _passwordTEController.text,
                            context: context);


                      },

                      child: Text(context.localizations.complete),
                    ),
                  );
                }
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
            controller: firstNameTEController,
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
            controller: lastNameTEController,
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
            controller: _emailTEController,
            autovalidateMode:AutovalidateMode.onUserInteraction ,
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
            controller: mobileTEController,
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
            controller: cityTEController,
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



/*
    Future<void> onTapSignUpButton() async{
    if(formKey.currentState!.validate()){
      SignUpModel signUpModel = SignUpModel(
          firstName: firstNameTEController.text.trim(),
          lastName: lastNameTEController.text.trim(),
          email: _emailTEController.text.trim(),
          mobile: mobileTEController.text.trim(),
          password: _passwordTEController.text,
          city:cityTEController.text.trim(),
      );

      final bool isSuccess = await signUpController.signUp(signUpModel);
      signUpController.signUpInProgress==true;

      if(isSuccess){
        signUpController.signUpInProgress==false;
        ShowSnackBarMessage(
          signUpController.successfullyMessage ?? 'Signup Successful!',
          context,
        );
        Navigator.pushNamed(
          context,
          VerifyOtpScreenOtp.name,
          arguments: _emailTEController.text.trim(),
        );
      }
      else{
        signUpController.signUpInProgress==false;
       // error message
        ShowSnackBarMessage(signUpController.errorMessage, context);


      }

    }
  }
*/






}
