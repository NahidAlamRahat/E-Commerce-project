import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:e_commerce/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreenOtp extends StatefulWidget {
  const VerifyOtpScreenOtp({super.key});

  static String name = 'verify-otp-screen';

  @override
  State<VerifyOtpScreenOtp> createState() => _VerifyOtpScreenOtpState();
}

class _VerifyOtpScreenOtpState extends State<VerifyOtpScreenOtp> {
  final TextEditingController _otpTEController = TextEditingController();

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
                context.localizations.enterOtpCode,
                style: textTheme.titleLarge?.copyWith(fontSize: 26),
              ),
              const SizedBox(height: 8),
              Text(
                context.localizations.otpCodeSent,
                style: textTheme.titleSmall?.copyWith(
                  fontSize: 16
                )
              ),
              const SizedBox(height: 16),
              PinCodeTextField(
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
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: Text(context.localizations.verify),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
