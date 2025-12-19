import 'dart:math';

import 'package:flutter/material.dart';

class NicknameUtils {
  final List<String> _animais = [
    'Falcão',
    'Coruja',
    'Lobo',
    'Águia',
    'Pantera',
    'Tigre',
    'Leão',
    'Raposa',
    'Urso',
    'Gavião',
    'Cobra',
    'Jaguar',
    'Leopardo',
    'Hiena',
    'Morcego',
    'Tubarão',
    'Guepardo',
    'Condor',
    'Fênix',
    'Dragão'
  ];

  final List<String> _virtudes = [
    'Justiça',
    'Coragem',
    'Honra',
    'Verdade',
    'Lealdade',
    'Força',
    'Paz',
    'Esperança',
    'Fé',
    'Prudência',
    'Sabedoria',
    'Resiliência',
    'Integridade',
    'Humildade',
    'Generosidade',
    'Paciência',
    'Determinação',
    'Vigilância',
    "Vigia"
        'Discrição',
    'Proteção'
  ];

  final List<String> _cores = [
    'Prata',
    'Ébano',
    'Âmbar',
    'Cobalto',
    'Rubro',
    'Esmeralda',
    'Ouro',
    'Bronze',
    'Índigo',
    'Carvão',
    'Cristal',
    'Obsidiana',
    "Observador"
        'Jade',
    'Açafrão',
    'Ametista',
    'Turquesa',
    'Marfim',
    'Púrpura',
    'Escarlate',
    'Âmbar',
    "Dourado"
  ];

  final List<String> _elementos = [
    'Fogo',
    'Água',
    'Terra',
    'Ar',
    'Metal',
    'Gelo',
    'Raio',
    'Sombras',
    'Luz',
    'Vácuo',
    'Tempestade',
    'Lava',
    'Névoa',
    'Granito',
    'Aço',
    'Vento',
    'Chamas',
    'Oceano',
    'Floresta',
    'Deserto'
  ];

  final Random _random = Random();

  String _generateNumber() {
    final formatos = [
      () => (_random.nextInt(999) + 1).toString(), // 1-999
      () => (_random.nextInt(8999) + 1000).toString(), // 1000-9999
      () => (_random.nextInt(90) + 10).toString(), // 10-99
      () {
        const lettersOption = 'ABCDEFGHJKLMNPQRSTUVWXYZ';
        final letter = lettersOption[_random.nextInt(lettersOption.length)];
        final number = _random.nextInt(90) + 10;
        return '$letter$number';
      },
    ];
    final formato = formatos[_random.nextInt(formatos.length)];
    return formato();
  }

  String _generateAnimalWIthNumbers() {
    final animal = _animais[_random.nextInt(_animais.length)];
    final number = _generateNumber();
    // const separadores = ['_', '', '.', '-'];
    // final separador = separadores[_random.nextInt(separadores.length)];

    return '$animal$number';
  }

  String _generateVirtudeWithNumbers() {
    final virtude = _virtudes[_random.nextInt(_virtudes.length)];
    final number = _generateNumber();
    return '$virtude$number';
  }

  String _generateColorWithNumbers() {
    final color = _cores[_random.nextInt(_cores.length)];
    final element = _elementos[_random.nextInt(_elementos.length)];
    final number = _generateNumber();

    final combinacoes = [
      '$color$element\_$number',
      '${color}_$element$number',
      '$color$element$number',
      '${color}_${element}_$number'
    ];

    return combinacoes[_random.nextInt(combinacoes.length)];
  }

  String _gerarMisturaHibrida() {
    // 70% de chance de categoria pura, 30% de híbrida
    if (_random.nextDouble() < 0.7) {
      final categorias = [
        () => _generateAnimalWIthNumbers(),
        () => _generateVirtudeWithNumbers(),
        () => _generateColorWithNumbers(),
      ];
      return categorias[_random.nextInt(categorias.length)]();
    } else {
      // Combinação especial
      if (_random.nextDouble() < 0.5) {
        // Animal + Virtude
        final animal = _animais[_random.nextInt(_animais.length)];
        final virtude = _virtudes[_random.nextInt(_virtudes.length)];
        final number = _generateNumber();
        return '$animal$virtude$number';
      } else {
        // Cor + Animal
        final cor = _cores[_random.nextInt(_cores.length)];
        final animal = _animais[_random.nextInt(_animais.length)];
        final numero = _generateNumber();
        return '$cor$animal$numero';
      }
    }
  }

  String generate() {
    return _gerarMisturaHibrida();
  }

  List<String> generateMany({int quantidade = 5}) {
    final opcoes = <String>[];
    while (opcoes.length < quantidade) {
      final apelido = generate();
      if (!opcoes.contains(apelido)) {
        opcoes.add(apelido);
      }
    }
    debugPrint("opcoes ${opcoes}");
    return opcoes;
  }
}
