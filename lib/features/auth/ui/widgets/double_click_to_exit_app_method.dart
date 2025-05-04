import 'package:e_commerce/features/auth/ui/widgets/show_snack_bar_message.dart';
import 'package:flutter/cupertino.dart';

DateTime? lastBackPressTime;

Future<bool> onWillPop({required BuildContext context}) async {
  DateTime currentTime = DateTime.now();
  print('currentTime:= $currentTime');
  bool backButton = lastBackPressTime == null ||
      currentTime.difference(lastBackPressTime!) > const Duration(seconds: 2);
  if (backButton) {
    lastBackPressTime = currentTime;
    print('Last time:= $lastBackPressTime');
    ShowSnackBarMessage('Double click to exit app', context);
    return false;
  }
  return true;
}
