import 'package:e_commerce/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

extension LocalizationExtension on BuildContext{
  AppLocalizations get localizations{
    return  AppLocalizations.of(this)!;
  }
}