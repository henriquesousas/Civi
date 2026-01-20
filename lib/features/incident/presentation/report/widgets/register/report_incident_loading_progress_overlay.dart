import 'package:deehelp/core/ui/extensions/screen_size_extension.dart';
import 'package:deehelp/core/ui/animation/transform_scale_opacity_animator.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/theme/app_text_styles.dart';
import 'package:deehelp/core/ui/theme/dimens.dart';
import 'package:deehelp/features/incident/presentation/providers/report_incident_viewmodel_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class ReportIncidentLoadingProgressOverlay extends ConsumerStatefulWidget {
  const ReportIncidentLoadingProgressOverlay({super.key});

  @override
  ConsumerState<ReportIncidentLoadingProgressOverlay> createState() =>
      _LoadingProgressPageState();
}

class _LoadingProgressPageState
    extends ConsumerState<ReportIncidentLoadingProgressOverlay> {
  double _progress = 0.0;
  String _message = "";

  final List<String> _messages = [
    "Iniciando",
    "Verificando localização",
    "Preparando alerta comunitário",
    "Finalizando registro..."
  ];

  @override
  void initState() {
    super.initState();
    _startProgress();
  }

  void _startProgress() {
    const totalDuration = 3;
    _updateProgress(0);

    for (int i = 1; i <= totalDuration; i++) {
      Future.delayed(Duration(seconds: i), () async {
        if (!mounted) return null;

        if (i == totalDuration) {
          _stopProgress();
          return;
        }

        setState(() {
          _progress = i / totalDuration;
          _message = i < _messages.length ? _messages[i] : _messages.last;
        });
      });
    }
  }

  void _stopProgress() async {
    setState(() {
      _message = "Finalizando registro...";
      _progress = 0.9;
    });

    await Future.delayed(
      const Duration(seconds: 2),
      () {
        if (mounted) {
          ref
              .read(reportIncidentViewmodelProvider.notifier)
              .stopSaveImediatelly();
        }
      },
    );
  }

  void _updateProgress(int second) {
    _progress = second / 3;
    _message = _messages[second.clamp(0, _messages.length - 1)];
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.size32),
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: TransformScaleOpacityAnimator(
                  duration: const Duration(milliseconds: 1500),
                  child: Lottie.asset(
                    "assets/lottie/ripple.json",
                    width: context.percentWidth(0.6),
                    height: context.percentHeight(0.6),
                    repeat: true,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: context.percentWidth(0.6),
              child: Text(
                _message,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: context.appTextStyles.sectionTitle.copyWith(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColorBody,
                ),
              ),
            ),
            const SizedBox(height: Dimens.size20),
            LinearProgressIndicator(
              value: _progress,
              backgroundColor: Colors.grey[300],
              valueColor:
                  const AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
              minHeight: 20,
              borderRadius: BorderRadius.circular(10),
            ),
            const SizedBox(height: Dimens.size32),
          ],
        ),
      ),
    );
  }
}
