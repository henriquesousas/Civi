import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IncidentSuccessScreen extends StatefulWidget {
  final String vehicleType;
  final String location;
  final DateTime incidentTime;

  const IncidentSuccessScreen({
    Key? key,
    required this.vehicleType,
    required this.location,
    required this.incidentTime,
  }) : super(key: key);

  @override
  _IncidentSuccessScreenState createState() => _IncidentSuccessScreenState();
}

class _IncidentSuccessScreenState extends State<IncidentSuccessScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideUpAnimation;
  late Animation<Offset> _slideOffsetAnimation;
  int _secondsRemaining = 5;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.1), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.1, end: 1.0), weight: 50),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 1.0, curve: Curves.easeInOut),
      ),
    );

    _slideUpAnimation = Tween<double>(begin: 30.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
      ),
    );

    _slideOffsetAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
      ),
    );

    _controller.forward();

    // Timer para auto-navegação
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (_secondsRemaining > 0) {
            _secondsRemaining--;
          } else {
            timer.cancel();
            _navigateBack();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _navigateBack() {
    // Navigator.of(context).popUntil((route) => route.isFirst);
    // Navigator.of(context).pop();
  }

  void _viewOnMap() {
    // Implementar navegação para o mapa
  }

  String _getVehicleEmoji() {
    switch (widget.vehicleType.toLowerCase()) {
      case 'carro':
        return '🚗';
      case 'moto':
      case 'motocicleta':
        return '🏍️';
      case 'caminhão':
      case 'caminhao':
        return '🚚';
      case 'ônibus':
      case 'onibus':
        return '🚌';
      case 'bicicleta':
        return '🚲';
      case 'celular':
      case 'eletrônico':
      case 'eletronico':
        return '📱';
      case 'objeto pessoal':
        return '🎒';
      default:
        return '🚨';
    }
  }

  String _formatTimeAgo(DateTime incidentTime) {
    final difference = DateTime.now().difference(incidentTime);

    if (difference.inSeconds < 60) {
      return 'Agora mesmo';
    } else if (difference.inMinutes < 60) {
      return 'Há ${difference.inMinutes} min';
    } else if (difference.inHours < 24) {
      return 'Há ${difference.inHours} h';
    } else {
      return 'Há ${difference.inDays} dias';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D47A1),
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF0D47A1),
                    const Color(0xFF1565C0),
                    const Color(0xFF1976D2),
                    const Color(0xFF42A5F5),
                  ],
                  stops: const [0.0, 0.4, 0.7, 1.0],
                ),
              ),
              child: Stack(
                children: [
                  // Background particles effect
                  // Positioned.fill(
                  //   child: Opacity(
                  //     opacity: 0.1,
                  //     child: Lottie.asset(
                  //       "assets/lottie/load_success.json", // Adicione um arquivo Lottie de partículas
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),

                  Column(
                    children: [
                      // Header com timer
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon:
                                  const Icon(Icons.close, color: Colors.white),
                              onPressed: _navigateBack,
                              splashRadius: 20,
                            ),
                            FadeTransition(
                              opacity: _fadeAnimation,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      color: Colors.white.withOpacity(0.8),
                                      size: 16,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      '$_secondsRemaining s',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 20),

                              // Animação de sucesso
                              ScaleTransition(
                                scale: _scaleAnimation,
                                child: Container(
                                  width: 180,
                                  height: 180,
                                  decoration: BoxDecoration(
                                    gradient: RadialGradient(
                                      colors: [
                                        Colors.white.withOpacity(0.3),
                                        Colors.white.withOpacity(0.1),
                                      ],
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 140,
                                      height: 140,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            blurRadius: 20,
                                            spreadRadius: 5,
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: Lottie.asset(
                                          "assets/lottie/loader_success.json",
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 40),

                              // Título com slide up
                              SlideTransition(
                                position: _slideOffsetAnimation,
                                child: Column(
                                  children: [
                                    Text(
                                      'ALERTA ENVIADO!',
                                      style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        letterSpacing: 1.2,
                                        shadows: [
                                          Shadow(
                                            blurRadius: 10,
                                            color:
                                                Colors.black.withOpacity(0.2),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      '✅ Sucesso na transmissão',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white.withOpacity(0.9),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 24),

                              // Mensagem principal
                              FadeTransition(
                                opacity: _fadeAnimation,
                                child: Transform.translate(
                                  offset: Offset(0, _slideUpAnimation.value),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Text(
                                      'Sua notificação foi compartilhada com a comunidade de segurança local',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white.withOpacity(0.95),
                                        height: 1.6,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 40),

                              // Card com informações
                              FadeTransition(
                                opacity: _fadeAnimation,
                                child: Transform.translate(
                                  offset: Offset(0, _slideUpAnimation.value),
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(24),
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Colors.white.withOpacity(0.15),
                                          Colors.white.withOpacity(0.08),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(24),
                                      border: Border.all(
                                        color: Colors.white.withOpacity(0.25),
                                        width: 1.5,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 20,
                                          offset: const Offset(0, 10),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Tipo de veículo
                                        Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                _getVehicleEmoji(),
                                                style: const TextStyle(
                                                    fontSize: 48),
                                              ),
                                              const SizedBox(height: 12),
                                              Text(
                                                widget.vehicleType
                                                    .toUpperCase(),
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  letterSpacing: 1.5,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        const SizedBox(height: 24),
                                        const Divider(
                                          color: Colors.white24,
                                          height: 1,
                                        ),
                                        const SizedBox(height: 24),

                                        // Localização
                                        _buildInfoRow(
                                          icon: Icons.location_pin,
                                          title: 'Localização',
                                          value: widget.location,
                                        ),

                                        const SizedBox(height: 20),

                                        // Horário
                                        _buildInfoRow(
                                          icon: Icons.access_time_filled,
                                          title: 'Horário',
                                          value: _formatTimeAgo(
                                              widget.incidentTime),
                                        ),

                                        const SizedBox(height: 20),

                                        // ID do alerta
                                        _buildInfoRow(
                                          icon: Icons.fingerprint,
                                          title: 'ID do Alerta',
                                          value:
                                              '#${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 32),

                              // Estatísticas
                              FadeTransition(
                                opacity: _fadeAnimation,
                                child: Transform.translate(
                                  offset: Offset(0, _slideUpAnimation.value),
                                  child: Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        _buildStatItem(
                                          icon: Icons.people_alt_rounded,
                                          value: '500+',
                                          label: 'Usuários notificados',
                                        ),
                                        Container(
                                          width: 1,
                                          height: 40,
                                          color: Colors.white.withOpacity(0.3),
                                        ),
                                        _buildStatItem(
                                          icon: Icons.bolt,
                                          value: '0.5s',
                                          label: 'Tempo de envio',
                                        ),
                                        Container(
                                          width: 1,
                                          height: 40,
                                          color: Colors.white.withOpacity(0.3),
                                        ),
                                        _buildStatItem(
                                          icon: Icons.shield,
                                          value: '100%',
                                          label: 'Confiabilidade',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 48),

                              // Botões
                              FadeTransition(
                                opacity: _fadeAnimation,
                                child: Transform.translate(
                                  offset: Offset(0, _slideUpAnimation.value),
                                  child: Column(
                                    children: [
                                      // Botão principal
                                      SizedBox(
                                        width: double.infinity,
                                        child: Material(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: Colors.white,
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            onTap: _viewOnMap,
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 18,
                                                horizontal: 24,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.map_rounded,
                                                    color:
                                                        const Color(0xFF0D47A1),
                                                  ),
                                                  const SizedBox(width: 12),
                                                  Text(
                                                    'VER NO MAPA',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: const Color(
                                                          0xFF0D47A1),
                                                      letterSpacing: 1.2,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      const SizedBox(height: 16),

                                      // Botão secundário
                                      SizedBox(
                                        width: double.infinity,
                                        child: Material(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: Colors.transparent,
                                          child: InkWell(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            onTap: _navigateBack,
                                            splashColor:
                                                Colors.white.withOpacity(0.1),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 18,
                                              ),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.white
                                                      .withOpacity(0.3),
                                                  width: 2,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'VOLTAR AO INÍCIO',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white,
                                                    letterSpacing: 1.1,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      const SizedBox(height: 8),

                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Text(
                                          'Você será redirecionado automaticamente em $_secondsRemaining segundos',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                Colors.white.withOpacity(0.7),
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(height: 32),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white.withOpacity(0.9),
          size: 24,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Column(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: Colors.white.withOpacity(0.8),
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
