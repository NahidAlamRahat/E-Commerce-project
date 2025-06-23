import 'dart:async';
import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/features/auth/data/models/verify_otp_model.dart';
import 'package:e_commerce/features/auth/ui/controllers/verify_otp_controller.dart';
import 'package:e_commerce/features/auth/ui/screens/sign_in_screen.dart';
import 'package:e_commerce/features/auth/ui/screens/sign_up_screen.dart';
import 'package:e_commerce/features/auth/ui/widgets/app_logo.dart';
import 'package:e_commerce/features/auth/ui/widgets/show_snack_bar_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreenOtp extends StatefulWidget {
  const VerifyOtpScreenOtp({super.key, required this.email});

  static String name = 'verify-otp-screen';

  final String email;

  @override
  State<VerifyOtpScreenOtp> createState() => _VerifyOtpScreenOtpState();
}

class _VerifyOtpScreenOtpState extends State<VerifyOtpScreenOtp> {
  final TextEditingController _otpTEController = TextEditingController();
  final VerifyOtpController _verifyOtpController = Get.find<VerifyOtpController>();
  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();

 final SignUpScreenState _signUpScreenState = SignUpScreenState();


  late RxInt currentTime = 30.obs;

  void _startTime() {
    currentTime.value = 30;

    Timer.periodic(
      const Duration(seconds: 1),
          (timer) {
        if (currentTime.value == 0) {
          timer.cancel();
        } else {
          currentTime.value = currentTime.value - 1;
        }
      },
    );
  }

  Widget _buildObxCountDownMethod() {
    return Obx(() {
      return Column(
        children: [
          Visibility(
            visible: currentTime.value == 0,
            child: TextButton(
              onPressed: () {
                // _signUpScreenState.onTapSignUpButton();
                _startTime();
                ShowSnackBarMessage('A new OTP has been sent to your Email', context);
              },
              child:  const Text('Resent OTP'),
            ),
          ),

          Visibility(
            visible: currentTime.value != 0,
            child: TextButton(
              onPressed: () {},
              child:  Text('Resent OTP in ${currentTime.value}'),
            ),
          ),
        ],
      );
    }
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTime();
  }


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 60),
              const AppLogo(),
              const SizedBox(height: 24),
              Text(
                // context.localizations.enterOtpCode,
                'Verify Email',
                style: textTheme.titleLarge?.copyWith(fontSize: 26),
              ),
              const SizedBox(height: 8),
              Text(
                // context.localizations.otpCodeSent,
                "check your email address",
                style: textTheme.titleSmall?.copyWith(
                  fontSize: 16
                )
              ),
              const SizedBox(height: 16),
              // _buildPinCodeTextField(context),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: (){
                  /*if(_formKey.currentState!.validate()){
                    //code hare
                    _onTapVerifyButton();
                  }*/

                  Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name, (route) => false,);

                },
                child: Text(context.localizations.verify),
              ),


              _buildObxCountDownMethod(),

            ],
          ),
        ),
      ),
    );
  }





/*
  Widget _buildPinCodeTextField(BuildContext context) {
    return Form(
      key: _formKey,
      child: PinCodeTextField(
                 validator: (value) {
                   if(value?.trim().isEmpty == true){
                     return context.localizations.enterCorrectOtp;
                   }
                   return null;
                 } ,

                length: 4,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                obscureText: false,
                animationType: AnimationType.fade,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                controller: _otpTEController,
                appContext: context,
              ),
     );
  }
*/

  Future<void> _onTapVerifyButton() async{
    VerifyOtpModel _verifyOtpModel = VerifyOtpModel(
      email: widget.email,
      otp: _otpTEController.text.trim(),
    );
    print(widget.email);

    bool isSuccess = await _verifyOtpController.verifyOtp(_verifyOtpModel);

    if(isSuccess){
      ShowSnackBarMessage(_verifyOtpController.successfullyMessage, context);
      Navigator.pushNamedAndRemoveUntil(context, SignInScreen.name, (route) => false,);
      isSuccess = true;
    }
    else{
      ShowSnackBarMessage(_verifyOtpController.errorMessage, context);
    }


  }


}
