import 'package:flutter/material.dart';

// class TestSyncServer extends StatelessWidget {
//   const TestSyncServer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF050816),
//       body: Stack(
//         children: [
//           // Background image
//           SizedBox(
//             height: 280,
//             width: double.infinity,
//             child: ShaderMask(
//               shaderCallback: (rect) {
//                 return const LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Colors.black,
//                     Colors.transparent,
//                   ],
//                 ).createShader(rect);
//               },
//               blendMode: BlendMode.darken,
//               child: Image.network(
//                 'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),

//           // Dark overlay
//           Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//                 colors: [
//                   Colors.black.withValues(alpha: 0.15),
//                   const Color(0xFF050816),
//                   const Color(0xFF050816),
//                 ],
//               ),
//             ),
//           ),

//           SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24),
//               child: Column(
//                 children: [
//                   const Spacer(),

//                   // Logo
//                   Container(
//                     width: 110,
//                     height: 110,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(
//                         color: Colors.white.withValues(alpha: 0.15),
//                         width: 2,
//                       ),
//                     ),
//                     child: ClipOval(
//                       child: Image.network(
//                         'https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 28),

//                   const Text(
//                     'Preparando seu Civi',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),

//                   const SizedBox(height: 14),

//                   Text(
//                     'Estamos baixando dados importantes\npara melhorar sua experiência.',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: Colors.white.withValues(alpha: 0.7),
//                       fontSize: 16,
//                       height: 1.5,
//                     ),
//                   ),

//                   const SizedBox(height: 40),

//                   // Progress card
//                   Container(
//                     padding: const EdgeInsets.all(22),
//                     decoration: BoxDecoration(
//                       color: Colors.white.withValues(alpha: 0.04),
//                       borderRadius: BorderRadius.circular(28),
//                       border: Border.all(
//                         color: Colors.white.withValues(alpha: 0.05),
//                       ),
//                     ),
//                     child: Column(
//                       children: [
//                         const Row(
//                           children: [
//                             Icon(
//                               Icons.cloud_download_rounded,
//                               color: Color(0xFF3B82F6),
//                             ),
//                             SizedBox(width: 12),
//                             Expanded(
//                               child: Text(
//                                 'Sincronizando informações',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 22),
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(30),
//                           child: const LinearProgressIndicator(
//                             minHeight: 10,
//                             value: null,
//                             backgroundColor: Color(0xFF1B2235),
//                             valueColor: AlwaysStoppedAnimation(
//                               Color(0xFF3B82F6),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         Text(
//                           'Isso pode levar alguns segundos...',
//                           style: TextStyle(
//                             color: Colors.white.withValues(alpha: 0.6),
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),

//                   const Spacer(),

//                   Text(
//                     'Civi © 2026',
//                     style: TextStyle(
//                       color: Colors.white.withValues(alpha: 0.35),
//                       fontSize: 13,
//                     ),
//                   ),

//                   const SizedBox(height: 24),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class TestSyncServer extends StatefulWidget {
  const TestSyncServer({super.key});

  @override
  State<TestSyncServer> createState() => _TestSyncServerState();
}

class _TestSyncServerState extends State<TestSyncServer>
    with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _progressController;
  late Animation<double> _pulseAnimation;

  final List<_SyncStep> _steps = [
    _SyncStep(label: 'Conectando ao servidor'),
    _SyncStep(label: 'Baixando configurações'),
    _SyncStep(label: 'Sincronizando dados'),
    _SyncStep(label: 'Finalizando'),
  ];

  int _currentStep = 0;

  @override
  void initState() {
    super.initState();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _simulateSync();
  }

  Future<void> _simulateSync() async {
    for (int i = 0; i < _steps.length; i++) {
      await Future.delayed(const Duration(milliseconds: 900));
      if (!mounted) return;
      setState(() => _currentStep = i);
      _progressController.forward(from: 0);
    }
    await Future.delayed(const Duration(milliseconds: 700));
    // navegar para home
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final progress = (_currentStep + 1) / _steps.length;

    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const Spacer(flex: 3),

              // Logo / ícone pulsando
              ScaleTransition(
                scale: _pulseAnimation,
                child: Container(
                  width: 88,
                  height: 88,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF1A1A1A),
                    border: Border.all(
                      color: const Color(0xFF3B8BD4).withOpacity(0.4),
                      width: 1.5,
                    ),
                  ),
                  child: const Icon(
                    Icons.shield_outlined,
                    size: 40,
                    color: Color(0xFF3B8BD4),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              const Text(
                'Preparando tudo para você',
                style: TextStyle(
                  color: Color(0xFFE8E6DF),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.3,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 8),

              const Text(
                'Isso acontece apenas na primeira vez.\nNão feche o aplicativo.',
                style: TextStyle(
                  color: Color(0xFF888780),
                  fontSize: 13,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),

              const Spacer(flex: 2),

              // Passos
              Column(
                children: List.generate(_steps.length, (i) {
                  final isDone = i < _currentStep;
                  final isActive = i == _currentStep;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: isDone
                              ? const Icon(Icons.check_circle_rounded,
                                  key: ValueKey('done'),
                                  size: 20,
                                  color: Color(0xFF1D9E75))
                              : isActive
                                  ? SizedBox(
                                      key: const ValueKey('loading'),
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: const Color(0xFF3B8BD4),
                                      ),
                                    )
                                  : Icon(
                                      key: const ValueKey('pending'),
                                      Icons.radio_button_unchecked,
                                      size: 20,
                                      color: const Color(0xFF444441),
                                    ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          _steps[i].label,
                          style: TextStyle(
                            fontSize: 14,
                            color: isDone
                                ? const Color(0xFF1D9E75)
                                : isActive
                                    ? const Color(0xFFE8E6DF)
                                    : const Color(0xFF5F5E5A),
                            fontWeight:
                                isActive ? FontWeight.w500 : FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),

              const SizedBox(height: 28),

              // Barra de progresso
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: progress),
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOut,
                      builder: (context, value, _) => LinearProgressIndicator(
                        value: value,
                        minHeight: 4,
                        backgroundColor: const Color(0xFF2C2C2A),
                        valueColor:
                            const AlwaysStoppedAnimation(Color(0xFF3B8BD4)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: progress),
                    duration: const Duration(milliseconds: 500),
                    builder: (context, value, _) => Text(
                      '${(value * 100).round()}%',
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xFF5F5E5A),
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}

class _SyncStep {
  final String label;
  const _SyncStep({required this.label});
}
