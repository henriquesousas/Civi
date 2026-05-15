import 'dart:math';

import 'package:deehelp/business/_shared/value_objects/value_object.dart';

class NickName extends ValueObject<String> {
  static const int _minLength = 5;
  static const int _maxLength = 30;

  static const adjectives = [
    'Ágil',
    'Atento',
    'Sábio',
    'Leal',
    'Vigilante',
    'Discreto',
    'Forte',
    'Calmo',
    'Esperto',
    'Valente',
    'Rápido',
    'Certeiro',
    'Seguro',
    'Pronto',
    'Protetor',
    'Justo',
  ];

  static const nouns = [
    'Coruja',
    'Guardião',
    'Radar',
    'Sentinela',
    'Alerta',
    'Escudo',
    'Farol',
    'Vigia',
    'Rastro',
    'Sinal',
    'Olho',
    'Ponto',
    'Ronda',
    'Trilha',
  ];

  NickName._(super.value);

  factory NickName.create(String value) {
    return NickName._(value);
  }

  static List<NickName> random(int count) {
    return _generate(count);
  }

  @override
  void validate(String value) {
    final sanitizedValue = value.trim();

    if (sanitizedValue.length < _minLength ||
        sanitizedValue.length > _maxLength) {
      addError("apelido",
          'Apelido deve ter entre $_minLength e $_maxLength caracteres.');
    }
  }

  static List<NickName> _generate(int count) {
    final random = Random();
    final names = <String>{};
    while (names.length < count) {
      final a = adjectives[random.nextInt(adjectives.length)];
      final n = nouns[random.nextInt(nouns.length)];

      final useNumber = random.nextBool();
      final number = 10 + random.nextInt(89);

      final name = useNumber ? '$a $n $number' : '$a $n';
      final nameTrim = name.replaceAll(RegExp(r'\s+'), '');
      names.add(nameTrim);
    }

    return names.toList().map((name) => NickName._(name)).toList();
  }
}
