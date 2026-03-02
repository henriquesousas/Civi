import 'package:flutter/material.dart';

class TestePageLoading extends StatefulWidget {
  const TestePageLoading({super.key});

  @override
  State<TestePageLoading> createState() => _TestePageLoadingState();
}

class _TestePageLoadingState extends State<TestePageLoading> {
  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

  Future<void> _bootstrap() async {
    await Future.delayed(const Duration(seconds: 2)); // simulação

    if (!mounted) return;

    // TODO: Navegar depois
    // context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min, // 👈 mantém centralizado
            children: [
              // Logo (troque pelo seu asset se quiser)
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: theme.colorScheme.primary,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 24,
                      offset: const Offset(0, 12),
                      color: theme.colorScheme.primary.withOpacity(.25),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.shield_rounded,
                  color: Colors.white,
                  size: 44,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                "KOTTO",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                "Validando informações...\nAguarde um momento.",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(.7),
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 24),

              const SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(strokeWidth: 3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
