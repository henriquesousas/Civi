import 'package:diacritic/diacritic.dart';

extension StringExtension on String? {
  bool isNullOrEmpty() {
    return this == null || this!.isEmpty;
  }

  String removeAccents() {
    return removeDiacritics(this!);
  }

  // bool isNotNullOrEmpty(String? texto) {
  //   return texto != null && texto.isNotEmpty;
  // }

  // bool isNullOrBlank(String? texto) {
  //   return texto == null || texto.trim().isEmpty;
  // }

  // bool isNotNullOrBlank(String? texto) {
  //   return texto != null && texto.trim().isNotEmpty;
  // }
}
