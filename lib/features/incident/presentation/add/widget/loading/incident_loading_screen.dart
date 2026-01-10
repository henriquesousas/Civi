import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/features/incident/presentation/add/widget/loading/incident_loading_message.dart';
import 'package:deehelp/features/incident/presentation/add/widget/loading/incident_loading_progress_widget.dart';
import 'package:deehelp/features/incident/presentation/add/widget/loading/incident_loading_top_image.dart';
import 'package:deehelp/features/incident/presentation/add/widget/loading/incident_summary_widget.dart';
import 'package:deehelp/features/incident/presentation/add/widget/loading/incident_warning_widget.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncidentLoadingScreen extends StatefulWidget {
  final Map<String, dynamic> incidentData;

  const IncidentLoadingScreen({Key? key, required this.incidentData})
      : super(key: key);

  @override
  _IncidentLoadingScreenState createState() => _IncidentLoadingScreenState();
}

class _IncidentLoadingScreenState extends State<IncidentLoadingScreen>
    with TickerProviderStateMixin {
  double _progress = 0.0;
  late Timer _timer;
  int _dotsCount = 0;
  // late AnimationController _pulseController;
  late AnimationController _glowController;

  final List<String> _loadingMessages = [
    "Analisando dados do incidente",
    "Verificando localização",
    "Gerando protocolo de segurança",
    "Preparando alerta comunitário",
    "Finalizando registro"
  ];
  int _currentMessageIndex = 0;

  @override
  void initState() {
    super.initState();

    // Controladores de animação
    // _pulseController = AnimationController(
    //   duration: const Duration(seconds: 2),
    //   vsync: this,
    // )..repeat(reverse: true);

    _glowController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    // Inicia o progresso
    _startLoading();
  }

  void _startLoading() {
    // Timer para os pontos animados
    Timer.periodic(const Duration(milliseconds: 300), (timer) {
      if (mounted) {
        setState(() {
          _dotsCount = (_dotsCount + 1) % 4;
        });
      }
    });

    // Timer para mudar as mensagens
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted && _currentMessageIndex < _loadingMessages.length - 1) {
        setState(() {
          _currentMessageIndex++;
        });
      }
    });

    // Timer para a barra de progresso (5 segundos)
    const totalDuration = 5; // segundos
    const interval = 50; // milissegundos (mais suave)
    const increments = totalDuration * 1000 / interval;
    const incrementValue = 1.0 / increments;

    _timer = Timer.periodic(const Duration(milliseconds: interval), (timer) {
      if (mounted) {
        setState(() {
          _progress += incrementValue;
          if (_progress >= 1.0) {
            _progress = 1.0;
            timer.cancel();

            // Navega para tela de sucesso após 500ms
            Future.delayed(const Duration(milliseconds: 500), () {
              if (mounted) {
                _navigateToSuccessScreen();
              }
            });
          }
        });
      }
    });
  }

  void _navigateToSuccessScreen() {
    // Navega para tela de sucesso
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => IncidentSuccessScreen(
          incidentData: widget.incidentData,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    // _pulseController.dispose();
    _glowController.dispose();
    super.dispose();
  }

  String _getDots() {
    return '.' * _dotsCount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900], // FUNDO AZUL ESCURO
      body: SafeArea(
        child: Stack(
          children: [
            // Background gradiente
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue[900]!,
                    Colors.blue[800]!,
                    Colors.blue[700]!,
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
            ),

            // Efeito de partículas/brilho
            AnimatedBuilder(
              animation: _glowController,
              builder: (context, child) {
                return Opacity(
                  opacity: 0.1 + (_glowController.value * 0.1),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        center: Alignment.center,
                        radius: 1.5,
                        colors: [
                          Colors.white.withValues(alpha: 0.3),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            // Conteúdo principal
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const IncidentLoadingTopImage(),
                  const SizedBox(height: 40),
                  IncidentLoadingMessage(
                    message: _loadingMessages[_currentMessageIndex],
                    dots: _getDots(),
                  ),
                  const SizedBox(height: 50),
                  IncidentLoadingProgressWidget(
                    progres: _progress,
                    dots: _getDots(),
                  ),
                  const Spacer(),
                  const IncidentSummaryWidget(),
                  const SizedBox(height: 10),
                  const IncidentWarningWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(dynamic date) {
    // if (date is DateTime) {
    //   final hour = date.hour.toString().padLeft(2, '0');
    //   final minute = date.minute.toString().padLeft(2, '0');
    //   return "$hour:$min0h";
    // }
    return "AGORA";
  }
}

// Tela de sucesso (simplificada para exemplo)
class IncidentSuccessScreen extends StatelessWidget {
  final Map<String, dynamic> incidentData;

  const IncidentSuccessScreen({Key? key, required this.incidentData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, size: 100, color: Colors.white),
            const SizedBox(height: 20),
            Text(
              "INCIDENTE REGISTRADO!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
