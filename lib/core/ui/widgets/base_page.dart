import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// T é o seu Cubit (ex: ProductCubit)
// S é o seu State (ex: ProductState)
abstract class BasePage<T extends StateStreamable<S>, S>
    extends StatefulWidget {
  final T? bloc;

  const BasePage({
    super.key,
    this.bloc,
  });

// Note: O método createState() é abstrato e deve ser implementado pela subclasse
// para referenciar a classe State correta.
}
