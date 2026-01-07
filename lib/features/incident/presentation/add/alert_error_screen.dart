import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:async';

class AlertErrorScreen extends StatefulWidget {
  final VoidCallback onRetry;
  final String? errorMessage;
  final int errorCode;

  const AlertErrorScreen({
    Key? key,
    required this.onRetry,
    this.errorMessage,
    this.errorCode = 0,
  }) : super(key: key);

  @override
  State<AlertErrorScreen> createState() => _AlertErrorScreenState();
}

class _AlertErrorScreenState extends State<AlertErrorScreen>
    with SingleTickerProviderStateMixin {
  // late AnimationController _controller;
  // late Animation<double> _shakeAnimation;
  // late Animation<double> _pulseAnimation;
  // late Animation<double> _fadeAnimation;
  bool _isRetrying = false;
  int _retryCount = 0;
  // late Timer _errorHighlightTimer;

  @override
  void initState() {
    super.initState();

    // _controller = AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 1500),
    // );

    // Animação de tremor para o ícone de erro
    // _shakeAnimation = TweenSequence<double>([
    //   TweenSequenceItem(tween: Tween(begin: 0.0, end: -0.02), weight: 20),
    //   TweenSequenceItem(tween: Tween(begin: -0.02, end: 0.02), weight: 20),
    //   TweenSequenceItem(tween: Tween(begin: 0.02, end: -0.02), weight: 20),
    //   TweenSequenceItem(tween: Tween(begin: -0.02, end: 0.02), weight: 20),
    //   TweenSequenceItem(tween: Tween(begin: 0.02, end: 0.0), weight: 20),
    // ]).animate(
    //   CurvedAnimation(
    //     parent: _controller,
    //     curve: Curves.easeInOut,
    //   ),
    // );

    // Animação de pulso para elementos importantes
    // _pulseAnimation = TweenSequence<double>([
    //   TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.05), weight: 50),
    //   TweenSequenceItem(tween: Tween(begin: 1.05, end: 1.0), weight: 50),
    // ]).animate(
    //   CurvedAnimation(
    //     parent: _controller,
    //     curve: Curves.easeInOut,
    //   ),
    // );

    // Animação de fade para entrada dos elementos
    // _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
    //   CurvedAnimation(
    //     parent: _controller,
    //     curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
    //   ),
    // );

    // _controller.forward();

    // Timer para destacar periodicamente o botão de retry
    // _errorHighlightTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
    //   if (mounted && _controller.status == AnimationStatus.completed) {
    //     _controller.forward(from: 0.0);
    //   }
    // });
  }

  @override
  void dispose() {
    // _controller.dispose();
    // _errorHighlightTimer.cancel();
    super.dispose();
  }

  Future<void> _handleRetry() async {
    if (_isRetrying) return;

    setState(() {
      _isRetrying = true;
      _retryCount++;
    });

    // Simular um pequeno delay para feedback visual
    await Future.delayed(const Duration(milliseconds: 800));

    if (mounted) {
      setState(() {
        _isRetrying = false;
      });
    }

    widget.onRetry();
  }

  String _getErrorTitle() {
    switch (widget.errorCode) {
      case 1:
        return 'SEM CONEXÃO';
      case 2:
        return 'SERVIDOR INDISPONÍVEL';
      case 3:
        return 'TEMPO ESGOTADO';
      default:
        return 'FALHA NO ENVIO';
    }
  }

  String _getErrorMessage() {
    if (widget.errorMessage != null) {
      return widget.errorMessage!;
    }

    switch (widget.errorCode) {
      case 1:
        return 'Verifique sua conexão com a internet e tente novamente.';
      case 2:
        return 'O servidor está temporariamente indisponível. Tente novamente em alguns instantes.';
      case 3:
        return 'A operação levou mais tempo que o esperado. Verifique sua conexão.';
      default:
        return 'Não foi possível enviar seu alerta para a comunidade.';
    }
  }

  String _getErrorEmoji() {
    switch (widget.errorCode) {
      case 1:
        return '📡';
      case 2:
        return '🚧';
      case 3:
        return '⏳';
      default:
        return '⚠️';
    }
  }

  Widget _buildErrorDetailCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline,
                  color: Colors.white.withOpacity(0.8), size: 20),
              const SizedBox(width: 8),
              Text(
                'DETALHES DO ERRO',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Código: ERR-${widget.errorCode.toString().padLeft(3, '0')}',
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (_retryCount > 0) ...[
            const SizedBox(height: 4),
            Text(
              'Tentativas: $_retryCount',
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 13,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTroubleshootTips() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.lightbulb_outline,
                  color: Colors.white.withOpacity(0.8), size: 18),
              const SizedBox(width: 8),
              Text(
                'SUGESTÕES',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          _buildTipItem('Verifique sua conexão com a internet'),
          _buildTipItem('Tente novamente em alguns segundos'),
          _buildTipItem('Reinicie o aplicativo se o problema persistir'),
        ],
      ),
    );
  }

  Widget _buildTipItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.chevron_right,
              color: Colors.white.withOpacity(0.6), size: 16),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 13,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB71C1C),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.topCenter,
              radius: 1.5,
              colors: [
                const Color(0xFFC62828),
                const Color(0xFFB71C1C),
                const Color(0xFF8E0E0E),
              ],
              stops: const [0.0, 0.5, 1.0],
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Ícone animado de erro
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            Colors.white.withOpacity(0.15),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Lottie.asset(
                              'assets/lottie/notification_error.json',
                              width: 120,
                              height: 120,
                            ),
                            // Text(
                            //   _getErrorEmoji(),
                            //   style: const TextStyle(fontSize: 28),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                // Título com animação de pulso
                Column(
                  children: [
                    Text(
                      _getErrorTitle(),
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: 1.2,
                        shadows: [
                          Shadow(
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.3),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      width: 80,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Mensagem de erro
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    _getErrorMessage(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.95),
                      height: 1.6,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                // Dicas de solução de problemas
                _buildTroubleshootTips(),

                // Card de detalhes do erro
                _buildErrorDetailCard(),

                const SizedBox(height: 32),

                // Botões
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      // Botão de tentar novamente
                      Material(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        elevation: _isRetrying ? 2 : 4,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: _isRetrying ? null : _handleRetry,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 18,
                              horizontal: 24,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (_isRetrying)
                                  SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation(
                                        const Color(0xFFC62828),
                                      ),
                                    ),
                                  )
                                else
                                  Icon(
                                    Icons.refresh_rounded,
                                    color: const Color(0xFFC62828),
                                  ),
                                const SizedBox(width: 12),
                                Text(
                                  _isRetrying
                                      ? 'ENVIANDO...'
                                      : 'TENTAR NOVAMENTE',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFFC62828),
                                    letterSpacing: 1.1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Botão de voltar
                      Material(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () => Navigator.pop(context),
                          splashColor: Colors.white.withOpacity(0.1),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 18,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white.withOpacity(0.3),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Center(
                              child: Text(
                                'VOLTAR',
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

                      const SizedBox(height: 20),

                      // Texto de suporte
                      Text(
                        'Se o problema persistir, entre em contato com o suporte',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.6),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
