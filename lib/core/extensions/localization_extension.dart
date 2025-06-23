import 'package:flutter/cupertino.dart';
import '../../l10n/app_localizations.dart';

extension LocalizationExtension on BuildContext{
  AppLocalizations get localizations{
  return  AppLocalizations.of(this)!;
}
}