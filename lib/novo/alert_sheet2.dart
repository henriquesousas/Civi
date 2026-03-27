import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum AlertFlowType {
  profile,
  community,
}

class AlertTypeSelectorBottomSheet extends StatelessWidget {
  final void Function(AlertFlowType type) onSelect;

  const AlertTypeSelectorBottomSheet({
    super.key,
    required this.onSelect,
  });

  static Future<void> show(
    BuildContext context, {
    required void Function(AlertFlowType type) onSelect,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (_) => AlertTypeSelectorBottomSheet(onSelect: onSelect),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF0B0E14),
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 10, 18, 22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 42,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
              const SizedBox(height: 18),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2B5BEE).withValues(alpha: 0.14),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFF2B5BEE).withValues(alpha: 0.35),
                      ),
                    ),
                    child: const Icon(
                      CupertinoIcons.bell_fill,
                      color: Color(0xFF82A7FF),
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Criar alerta',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.4,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Escolha se o alerta está ligado a um item do seu perfil ou a uma situação da comunidade ao seu redor.',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.68),
                            fontSize: 13.5,
                            height: 1.35,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              _AlertFlowCard(
                title: 'Alerta do perfil',
                subtitle:
                    'Use quando a ocorrência envolver um item cadastrado por você, como veículo, celular ou outro item do seu perfil.',
                icon: CupertinoIcons.person_crop_circle_badge_exclam,
                iconColor: const Color(0xFF82A7FF),
                gradient: const [
                  Color(0xFF17327A),
                  Color(0xFF0F1C45),
                ],
                badge: 'Seu item',
                onTap: () => onSelect(AlertFlowType.profile),
              ),
              const SizedBox(height: 12),
              _AlertFlowCard(
                title: 'Alerta da comunidade',
                subtitle:
                    'Avise sobre situações da região, como atividade suspeita, alagamento, falta de luz, perturbação e outros alertas locais.',
                icon: CupertinoIcons.location_solid,
                iconColor: const Color(0xFFFFC266),
                gradient: const [
                  Color(0xFF2B2114),
                  Color(0xFF17120C),
                ],
                badge: 'Região',
                onTap: () => onSelect(AlertFlowType.community),
              ),
              const SizedBox(height: 18),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.04),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.06),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      CupertinoIcons.info_circle_fill,
                      color: Colors.white.withValues(alpha: 0.72),
                      size: 18,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Publique alertas reais e relevantes para ajudar pessoas próximas a agir mais rápido.',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.68),
                          fontSize: 12.5,
                          height: 1.4,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AlertFlowCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final List<Color> gradient;
  final String badge;
  final VoidCallback onTap;

  const _AlertFlowCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.gradient,
    required this.badge,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: gradient,
            ),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.08),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.18),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.10),
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.08),
                    ),
                  ),
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: 26,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.10),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          badge,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15.5,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.2,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        subtitle,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.76),
                          fontSize: 12.5,
                          height: 1.35,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.10),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    CupertinoIcons.chevron_right,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum CommunityAlertType {
  suspiciousActivity,
  flood,
  powerOutage,
  noiseComplaint,
  blockedRoad,
  localRisk,
}

class CommunityAlertOption {
  final CommunityAlertType type;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  const CommunityAlertOption({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });
}

class CommunityAlertBottomSheet extends StatelessWidget {
  final void Function(CommunityAlertType type) onSelect;

  const CommunityAlertBottomSheet({
    super.key,
    required this.onSelect,
  });

  static Future<void> show(
    BuildContext context, {
    required void Function(CommunityAlertType type) onSelect,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (_) => CommunityAlertBottomSheet(onSelect: onSelect),
    );
  }

  @override
  Widget build(BuildContext context) {
    final options = <CommunityAlertOption>[
      const CommunityAlertOption(
        type: CommunityAlertType.suspiciousActivity,
        title: 'Atividade suspeita',
        subtitle: 'Movimentação ou atitude incomum',
        icon: CupertinoIcons.eye_fill,
        color: Color(0xFFFFB84D),
      ),
      const CommunityAlertOption(
        type: CommunityAlertType.flood,
        title: 'Alagamento',
        subtitle: 'Acúmulo de água ou risco na via',
        icon: CupertinoIcons.drop_fill,
        color: Color(0xFF4DA3FF),
      ),
      const CommunityAlertOption(
        type: CommunityAlertType.powerOutage,
        title: 'Falta de luz',
        subtitle: 'Queda de energia na região',
        icon: CupertinoIcons.bolt_fill,
        color: Color(0xFFFFD84D),
      ),
      const CommunityAlertOption(
        type: CommunityAlertType.noiseComplaint,
        title: 'Lei do sossego',
        subtitle: 'Barulho excessivo ou perturbação',
        icon: CupertinoIcons.speaker_2_fill,
        color: Color(0xFFFF7A7A),
      ),
      const CommunityAlertOption(
        type: CommunityAlertType.blockedRoad,
        title: 'Via bloqueada',
        subtitle: 'Rua interditada ou difícil acesso',
        icon: CupertinoIcons.rocket,
        color: Color(0xFF8F7CFF),
      ),
      const CommunityAlertOption(
        type: CommunityAlertType.localRisk,
        title: 'Risco na região',
        subtitle: 'Situação que exige atenção',
        icon: CupertinoIcons.exclamationmark_triangle_fill,
        color: Color(0xFFFF9F43),
      ),
    ];

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF0B0E14),
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 10, 18, 22),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 42,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.14),
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Alerta da comunidade',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.4,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Escolha o tipo de alerta que melhor representa a situação da região.',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.68),
                    fontSize: 13.5,
                    height: 1.35,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 18),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: options.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.03,
                  ),
                  itemBuilder: (_, index) {
                    final option = options[index];
                    return _CommunityOptionCard(
                      option: option,
                      onTap: () => onSelect(option.type),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CommunityOptionCard extends StatelessWidget {
  final CommunityAlertOption option;
  final VoidCallback onTap;

  const _CommunityOptionCard({
    required this.option,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.045),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.06),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 46,
                  height: 46,
                  decoration: BoxDecoration(
                    color: option.color.withValues(alpha: 0.14),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: option.color.withValues(alpha: 0.28),
                    ),
                  ),
                  child: Icon(
                    option.icon,
                    color: option.color,
                    size: 22,
                  ),
                ),
                const Spacer(),
                Text(
                  option.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14.2,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.2,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  option.subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.60),
                    fontSize: 11.8,
                    height: 1.28,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
