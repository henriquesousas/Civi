import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

//GpsDisabledPage
class TestPage13 extends StatelessWidget {
  const TestPage13({super.key});

  static const _bg = Color(0xFFF5F7FD);
  static const _surface = Colors.white;

  static const _primary = Color(0xFF2157F8);
  static const _ink = Color(0xFF1F2A44);
  static const _muted = Color(0xFF8A96C8);

  Future<void> _openLocationSettings() async {
    await Geolocator.openLocationSettings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Ícone principal
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  color: _primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: const Icon(
                  Icons.location_off_rounded,
                  size: 48,
                  color: _primary,
                ),
              ),

              const SizedBox(height: 24),

              // Título
              const Text(
                'Ative o GPS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: _ink,
                ),
              ),

              const SizedBox(height: 12),

              // Descrição principal
              const Text(
                'Para funcionar corretamente, o Kotto precisa acessar sua localização.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.5,
                  height: 1.4,
                  fontWeight: FontWeight.w600,
                  color: _ink,
                ),
              ),

              const SizedBox(height: 8),

              // Explicação secundária
              const Text(
                'Usamos o GPS para mostrar ocorrências próximas, '
                'mapa da região e alertas relevantes para você.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.5,
                  height: 1.4,
                  fontWeight: FontWeight.w600,
                  color: _muted,
                ),
              ),

              const SizedBox(height: 28),

              // Card informativo (opcional, mas elegante)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _surface,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFE6EAF6)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x14000000),
                      blurRadius: 16,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(
                      Icons.lock_outline,
                      size: 20,
                      color: _muted,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Sua localização é usada apenas para exibir informações '
                        'da sua região. O Kotto não rastreia você em segundo plano.',
                        style: TextStyle(
                          fontSize: 13,
                          height: 1.35,
                          fontWeight: FontWeight.w600,
                          color: _muted,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Botão principal
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: _openLocationSettings,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: const Text(
                    'Ativar GPS',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Botão secundário (opcional)
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Tentar novamente',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: _muted,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
