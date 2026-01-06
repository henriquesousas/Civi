import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// TELA DE ENVIO EM PROGRESSO
class SendingAlertScreen extends StatefulWidget {
  final String vehicleType;
  final String location;

  const SendingAlertScreen({
    Key? key,
    required this.vehicleType,
    required this.location,
  }) : super(key: key);

  @override
  _SendingAlertScreenState createState() => _SendingAlertScreenState();
}

class _SendingAlertScreenState extends State<SendingAlertScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _pulseAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
      case 'celular':
      case 'eletrônico':
        return '📱';
      default:
        return '🚨';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1565C0), // Azul um pouco mais claro
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFF0D47A1),
                const Color(0xFF1976D2),
                const Color(0xFF42A5F5),
              ],
              stops: const [0.0, 0.6, 1.0],
            ),
          ),
          child: Column(
            children: [
              // Progresso no topo (opcional)
              const LinearProgressIndicator(
                backgroundColor: Color(0xFF0D47A1),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                minHeight: 3,
              ),

              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Animação de envio
                        ScaleTransition(
                          scale: _pulseAnimation,
                          child: Container(
                            width: 180,
                            height: 180,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.15),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Container(
                                width: 140,
                                height: 140,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Lottie.asset(
                                    "assets/lottie/loader_success.json", // Animação de envio
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.contain,
                                    controller: _controller,
                                    onLoaded: (composition) {
                                      _controller.duration =
                                          composition.duration;
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 40),

                        // Título animado
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: Text(
                            'ENVIANDO ALERTA...',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Subtítulo com dots animados
                        _buildLoadingDots(),

                        const SizedBox(height: 40),

                        // Card com informações sendo enviadas
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.2),
                              ),
                            ),
                            child: Column(
                              children: [
                                // Ícone do veículo
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Center(
                                    child: Text(
                                      _getVehicleEmoji(),
                                      style: const TextStyle(fontSize: 32),
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 15),

                                // Tipo de veículo
                                Text(
                                  widget.vehicleType.toUpperCase(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),

                                const SizedBox(height: 10),

                                // Localização
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        widget.location,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white.withOpacity(0.9),
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 15),

                                // Status de envio
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        color: Colors.yellow,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Preparando envio',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white.withOpacity(0.8),
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 40),

                        // Progresso em etapas
                        _buildProgressSteps(),

                        const Spacer(),

                        // Mensagem de segurança
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              'O alerta será enviado para todos os usuários próximos em sua região.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.7),
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDot(0),
        const SizedBox(width: 8),
        _buildDot(200),
        const SizedBox(width: 8),
        _buildDot(400),
      ],
    );
  }

  Widget _buildDot(int delay) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: _getDotColor(delay),
        shape: BoxShape.circle,
      ),
    );
  }

  Color _getDotColor(int delay) {
    final time = DateTime.now().millisecondsSinceEpoch;
    final cycle = (time + delay) % 1200;

    if (cycle < 400) {
      return Colors.white.withOpacity(0.3);
    } else if (cycle < 800) {
      return Colors.white.withOpacity(0.6);
    } else {
      return Colors.white;
    }
  }

  Widget _buildProgressSteps() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          _buildStep(
            completed: true,
            label: 'Dados coletados',
            icon: Icons.check_circle,
          ),
          const SizedBox(height: 12),
          _buildStep(
            completed: false,
            label: 'Enviando para servidor',
            icon: Icons.cloud_upload,
            isCurrent: true,
          ),
          const SizedBox(height: 12),
          _buildStep(
            completed: false,
            label: 'Notificando comunidade',
            icon: Icons.notifications_active,
          ),
        ],
      ),
    );
  }

  Widget _buildStep({
    required bool completed,
    required String label,
    required IconData icon,
    bool isCurrent = false,
  }) {
    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: completed
                ? Colors.green
                : isCurrent
                    ? Colors.yellow
                    : Colors.white.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: completed
                ? const Icon(Icons.check, size: 18, color: Colors.white)
                : isCurrent
                    ? const Icon(Icons.autorenew, size: 18, color: Colors.black)
                    : Icon(icon,
                        size: 18, color: Colors.white.withOpacity(0.5)),
          ),
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: completed || isCurrent
                  ? Colors.white
                  : Colors.white.withOpacity(0.6),
              fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
