import 'dart:async';

import 'package:deehelp/core/theme/size/radius_size.dart';
import 'package:deehelp/core/ui/styles/app_text_style.dart';
import 'package:deehelp/old_core/ui/extensions/screen_size_extension.dart';
import 'package:deehelp/old_core/ui/animation/transform_scale_opacity_animator.dart';
import 'package:deehelp/old_core/ui/theme/app_colors.dart';
import 'package:deehelp/old_core/ui/theme/app_text_styles.dart';
import 'package:deehelp/old_core/ui/theme/dimens.dart';
import 'package:deehelp/old_features/incident/presentation/providers/report_incident_viewmodel_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class TesteIncidentLoading extends ConsumerStatefulWidget {
  const TesteIncidentLoading({super.key});

  @override
  ConsumerState<TesteIncidentLoading> createState() =>
      _LoadingProgressPageState();
}

class _LoadingProgressPageState extends ConsumerState<TesteIncidentLoading> {
  double _progress = 0.0;
  String _message = "Iniciando";

  Timer? _timer;
  int _tick = 0;

  final List<String> _messages = const [
    "Iniciando…",
    "Verificando localização…",
    "Preparando alerta comunitário…",
    "Finalizando registro…",
  ];

  // UX mais premium: duração um pouco maior e curva suave
  static const _totalTicks = 9; // ~ 3.6s (9 * 400ms)
  static const _tickDuration = Duration(milliseconds: 400);

  @override
  void initState() {
    super.initState();
    _startProgress();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startProgress() {
    _timer?.cancel();
    _tick = 0;

    setState(() {
      _progress = 0.06;
      _message = _messages.first;
    });

    _timer = Timer.periodic(_tickDuration, (t) {
      if (!mounted) return;

      _tick++;

      // progresso com “ease” (visual mais elegante): sobe mais rápido no começo e desacelera no final
      final raw = (_tick / _totalTicks).clamp(0.0, 1.0);
      final eased = Curves.easeOutCubic.transform(raw);

      final msgIndex = (raw * (_messages.length - 1)).floor().clamp(
            0,
            _messages.length - 1,
          );

      setState(() {
        _progress = 0.06 + eased * 0.84; // vai até ~0.90
        _message = _messages[msgIndex];
      });

      if (_tick >= _totalTicks) {
        t.cancel();
        _stopProgress();
      }
    });
  }

  Future<void> _stopProgress() async {
    if (!mounted) return;

    setState(() {
      _message = _messages.last;
      _progress = 0.92;
    });

    // pausa curta “premium” antes de concluir
    await Future.delayed(const Duration(milliseconds: 900));

    if (!mounted) return;

    // conclui visualmente
    setState(() => _progress = 1.0);

    await Future.delayed(const Duration(milliseconds: 250));

    if (!mounted) return;

    ref.read(reportIncidentViewmodelProvider.notifier).stopSaveImediatelly();
  }

  @override
  Widget build(BuildContext context) {
    final w = context.percentWidth(1);
    final maxContent = w > 520 ? 520.0 : w; // mantém elegante no tablet/web

    return Material(
      child: Stack(
        children: [
          // background suave + leve profundidade
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFF7F9FF),
                    Color(0xFFF2F6FF),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),

          SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxContent),
                child: Padding(
                  padding: const EdgeInsets.all(Dimens.size20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Card central com Lottie
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.95),
                          borderRadius:
                              BorderRadius.circular(RadiusSize.xl + 2),
                          border: Border.all(
                            color: AppColors.lightGreyColor30
                                .withValues(alpha: 0.45),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x14000000),
                              blurRadius: 22,
                              offset: Offset(0, 12),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            TransformScaleOpacityAnimator(
                              duration: const Duration(milliseconds: 1200),
                              child: Lottie.asset(
                                "assets/lottie/ripple.json",
                                width: context.percentWidth(0.52),
                                height: context.percentWidth(0.52),
                                repeat: true,
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Texto principal (mais clean e controlado)
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 220),
                              switchInCurve: Curves.easeOut,
                              switchOutCurve: Curves.easeIn,
                              child: Text(
                                _message,
                                key: ValueKey(_message),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    context.appTextStyles.sectionTitle.copyWith(
                                  fontSize: 18.sp.clamp(16, 22),
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.textColorBody,
                                  height: 1.15,
                                ),
                              ),
                            ),

                            const SizedBox(height: 12),

                            // Subtexto discreto para “premium”
                            Text(
                              "Isso pode levar alguns segundos",
                              textAlign: TextAlign.center,
                              style: context.appText.bodySmall.copyWith(
                                fontSize: 12.5.sp.clamp(12, 14),
                                fontWeight: FontWeight.w600,
                                color: AppColors.textColorBody
                                    .withValues(alpha: 0.55),
                              ),
                            ),

                            const SizedBox(height: 16),

                            // Progress “pill” elegante
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(RadiusSize.xl),
                              child: LinearProgressIndicator(
                                value: _progress,
                                minHeight: 10,
                                backgroundColor: const Color(0xFFEFF3FF),
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  AppColors.primaryColor,
                                ),
                              ),
                            ),

                            const SizedBox(height: 10),

                            // Percentual discreto (ajuda confiança do usuário)
                            Text(
                              "${(_progress * 100).round()}%",
                              style: context.appText.bodySmall.copyWith(
                                fontWeight: FontWeight.w800,
                                color: AppColors.textColorBody
                                    .withValues(alpha: 0.45),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 14),

                      // Rodapé discreto (sem botões pra não “quebrar” o flow)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.75),
                          borderRadius: BorderRadius.circular(RadiusSize.xl),
                          border: Border.all(
                            color: AppColors.lightGreyColor30
                                .withValues(alpha: 0.35),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.shield_outlined,
                              size: 18,
                              color: AppColors.textColorBody
                                  .withValues(alpha: 0.55),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              "Avisando a comunidade com segurança",
                              style: context.appText.bodySmall.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.textColorBody
                                    .withValues(alpha: 0.55),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
