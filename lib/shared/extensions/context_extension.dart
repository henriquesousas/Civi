import 'package:flutter/widgets.dart';

import '../../l10n/app_localizations.dart';

extension AppLocalizationsExtension on BuildContext {
  AppLocalizations get strings => AppLocalizations.of(this)!;
}
