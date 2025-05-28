import 'dart:async';
import 'package:e_commerce/core/extensions/app_localization_extension.dart';
import 'package:e_commerce/feature/auth/ui/controller/otp_veriffication_controller.dart';
import 'package:e_commerce/feature/auth/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../app/app_color.dart';
import '../../data/model/verify_otp_model.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.email});

  static String name = '/OtpVerification';

  final String email;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _otpTEController = TextEditingController();

  VerifyOtpController otpVerifyicationController =
      Get.find<VerifyOtpController>();

  Timer? _timer;
  RxInt currentTime = 30.obs;

  void _startTime() {
    _timer?.cancel();
    currentTime.value = 30;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentTime.value == 0) {
        _timer?.cancel();
      } else {
        currentTime.value--;
      }
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
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0, forceMaterialTransparency: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            children: [
              const SizedBox(height: 120),
              AppLogo(),
              SizedBox(height: 16),
              Text(
                context.localizations.enterOtp,
                style: context.textTheme.titleLarge,
              ),
              Text(
                context.localizations.otpSent,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(height: 20),
              _buildPinCodeTextField(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: GetBuilder<VerifyOtpController>(
                  builder: (controller) {
                    return controller.inProgress == true
                        ? Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              oneTabVerityOtp();
                            }
                          },
                          child: Text('Verify'),
                        );
                  },
                ),
              ),

              Obx(() {
                return TextButton(
                  onPressed: currentTime.value == 0
                      ? () {
                    otpVerifyicationController.resendOtp(widget.email);
                    _startTime();
                  }
                      : null,
                  child: Text(
                    currentTime.value == 0
                        ? 'Resend OTP'
                        : 'Resend OTP in ${currentTime.value}',
                  ),
                );
              }),


            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPinCodeTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Form(
        key: _formkey,
        child: PinCodeTextField(
          length: 4,
          controller: _otpTEController,
          animationType: AnimationType.fade,
          keyboardType: TextInputType.number,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            fieldHeight: 50,
            fieldWidth: 50,
            activeFillColor: Colors.white,
            selectedFillColor: AppColors.themeColor,
            inactiveFillColor: Colors.teal.shade50,
            activeColor: AppColors.themeColor,
            selectedColor: AppColors.themeColor,
            inactiveColor: Colors.white,
          ),
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          enableActiveFill: true,
          appContext: context,
          onChanged: (value) {},
          validator: (value) {
            if ((value?.length ?? 0) < 4) {
              return 'Enter your otp';
            }
            return null;
          },
        ),
      ),
    );
  }

  Future<void> oneTabVerityOtp() async {
    VerifyOtpModel verifyOtpModel = VerifyOtpModel(
      email: widget.email,
      otp: _otpTEController.text,
    );
    bool isSuccess = await otpVerifyicationController.verify(verifyOtpModel);
    if (isSuccess) {
      Get.back();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }


}
