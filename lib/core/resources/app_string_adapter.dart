import '../../l10n/app_localizations.dart';
import 'app_strings.dart';

class AppStringsAdapter implements AppStrings {
  final AppLocalizations? l10n;

  AppStringsAdapter(this.l10n);

  @override
  String get passwordTooShort => l10n != null ? l10n!.start : '';
}
