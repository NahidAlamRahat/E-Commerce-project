import 'package:e_commerce/core/extensions/localization_extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';

class SignInRichText extends StatelessWidget {
   SignInRichText({
    super.key,

    required this.voidCallback

  });

  final VoidCallback voidCallback;


  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: context.localizations.haveAnAccount,
        style: TextStyle(
          color: AppColors.blackColor,
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(
            text: ' ${context.localizations.signIn}',
            style: TextStyle(
              color: AppColors.themeColor,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                voidCallback();
              },
          ),
        ],
      ),
    );
  }
}
