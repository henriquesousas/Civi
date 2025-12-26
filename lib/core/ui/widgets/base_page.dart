import 'package:flutter_riverpod/flutter_riverpod.dart';

// P é o Provider
// S é o seu State
abstract class BasePage<P extends ProviderListenable<S>, S>
    extends ConsumerStatefulWidget {
  final P provider;

  const BasePage({
    super.key,
    required this.provider,
  });

// Note: O método createState() é abstrato e deve ser implementado pela subclasse
// para referenciar a classe State correta.
}
