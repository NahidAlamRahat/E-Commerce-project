import 'package:e_commerce/features/auth/ui/widgets/show_snack_bar_message.dart';
import 'package:flutter/cupertino.dart';

DateTime? _lastBackPressTime;

Future<bool> onWillPop({required BuildContext context}) async {
  DateTime currentTime = DateTime.now();
  print('currentTime:= $currentTime');
  bool backButton = _lastBackPressTime == null ||
      currentTime.difference(_lastBackPressTime!) > const Duration(seconds: 2);
  if (backButton) {
    _lastBackPressTime = currentTime;
    print('Last time:= $_lastBackPressTime');
    ShowSnackBarMessage('Double click to exit app', context);
    return false;
  }
  return true;
}

