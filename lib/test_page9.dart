import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

enum ItemType { car, moto, phone }

class TestPage9 extends StatelessWidget {
  const TestPage9({
    super.key,
    this.itemType = ItemType.car,
    this.isImmediate = true,
    this.itemName = 'CG Titan 150',
    this.regionLabel = 'Centro • São Paulo/SP',
    this.incidentId = 'INC-20401',
    this.imei, // apenas para celular
    this.onCompleteDetails,
    this.onGoToDetails,
  });

  final ItemType itemType;
  final bool isImmediate;
  final String itemName;
  final String regionLabel;
  final String incidentId;
  final String? imei;

  /// callback opcional (para voltar e abrir modo detalhado automaticamente)
  final VoidCallback? onCompleteDetails;

  /// callback opcional (ir para detalhes da ocorrência)
  final VoidCallback? onGoToDetails;

  static const _blue = Color(0xFF2157F8);
  static const _inkOnBlue = Colors.white;

  bool get isPhone => itemType == ItemType.phone;
  bool get isVehicle => itemType == ItemType.car || itemType == ItemType.moto;

  String _shareText() {
    final typeText = isImmediate ? 'Registro imediato' : 'Registro detalhado';
    final imeiText =
        (isPhone && (imei?.isNotEmpty ?? false)) ? '\nIMEI: $imei' : '';
    return '🚨 Incidente reportado\n'
        'Item: $itemName\n'
        'Tipo: $typeText\n'
        'Região: $regionLabel\n'
        'ID: $incidentId$imeiText\n\n'
        'Se você tiver informações, ajude compartilhando.';
  }

  void _share() => Share.share(_shareText(), subject: 'Incidente • $itemName');

  Future<void> _callPolice(BuildContext context) async {
    // const uri = Uri.parse('tel:190');
    // if (await canLaunchUrl(uri)) {
    //   await launchUrl(uri);
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text('Não foi possível iniciar a chamada.')),
    //   );
    // }
  }

  Future<void> _copyImei(BuildContext context) async {
    if (imei == null || imei!.trim().isEmpty) return;
    await Clipboard.setData(ClipboardData(text: imei!.trim()));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('IMEI copiado.')),
    );
  }

  Future<void> _openUrl(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Não foi possível abrir o link.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _blue,
      body: SafeArea(
        child: Stack(
          children: [
            // Decorative glows (sutil)
            Positioned(
              top: -120,
              right: -120,
              child: Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.10),
                ),
              ),
            ),
            Positioned(
              bottom: -140,
              left: -140,
              child: Container(
                width: 320,
                height: 320,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.08),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Top bar
                  Row(
                    children: [
                      _TopIconButton(
                        icon: Icons.close,
                        onTap: () => Navigator.pop(context),
                      ),
                      const Spacer(),
                      _TopIconButton(
                        icon: Icons.share_outlined,
                        onTap: _share,
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        // Hero
                        Center(
                          child: Container(
                            width: 72,
                            height: 72,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.16),
                              borderRadius: BorderRadius.circular(26),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.18),
                              ),
                            ),
                            child: const Icon(
                              Icons.verified_rounded,
                              color: _inkOnBlue,
                              size: 34,
                            ),
                          ),
                        ),

                        const SizedBox(height: 14),

                        const Text(
                          'Incidente reportado!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _inkOnBlue,
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 0.2,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          isImmediate
                              ? 'Registro enviado com sucesso.\nVocê pode complementar os detalhes depois.'
                              : 'Registro detalhado enviado com sucesso.\nObrigado por ajudar a comunidade.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.92),
                            fontSize: 14.5,
                            height: 1.35,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Summary card
                        _GlassCard(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  itemName,
                                  style: const TextStyle(
                                    color: _inkOnBlue,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  regionLabel,
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.90),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Wrap(
                                  spacing: 10,
                                  runSpacing: 10,
                                  children: [
                                    _MiniPill(
                                      icon: Icons.fingerprint_outlined,
                                      text: incidentId,
                                    ),
                                    _MiniPill(
                                      icon: Icons.flash_on_outlined,
                                      text: isImmediate
                                          ? 'Imediato'
                                          : 'Detalhado',
                                    ),
                                    _MiniPill(
                                      icon: isVehicle
                                          ? Icons.directions_car_outlined
                                          : Icons.phone_iphone_outlined,
                                      text: isVehicle ? 'Veículo' : 'Celular',
                                    ),
                                  ],
                                ),
                                if (isPhone && (imei?.isNotEmpty ?? false)) ...[
                                  const SizedBox(height: 12),
                                  _GlassInlineInfo(
                                    icon: Icons.dialpad_outlined,
                                    title: 'IMEI',
                                    subtitle: imei!,
                                    trailing: _InlineChipButton(
                                      label: 'Copiar',
                                      icon: Icons.copy_outlined,
                                      onTap: () => _copyImei(context),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        // ✅ BO ASAP
                        _GlassCard(
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: _GlassInlineInfo(
                              icon: Icons.assignment_turned_in_outlined,
                              title: 'Faça o boletim de ocorrência',
                              subtitle:
                                  'Recomendamos registrar o BO o mais rápido possível. Isso ajuda na investigação e aumenta as chances de recuperação.',
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        // ✅ Safety note
                        _GlassCard(
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: _GlassInlineInfo(
                              icon: Icons.health_and_safety_outlined,
                              title: 'Cuide da sua segurança',
                              subtitle:
                                  'Se você estiver em risco, procure um local seguro e acione ajuda imediatamente.',
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        // ✅ Next steps checklist
                        _GlassCard(
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const _GlassHeader(
                                  icon: Icons.checklist_outlined,
                                  title: 'Próximos passos',
                                ),
                                const SizedBox(height: 10),
                                _CheckRow(
                                  text: 'Registre o boletim de ocorrência',
                                ),
                                _CheckRow(
                                  text: isPhone
                                      ? 'Bloqueie o IMEI junto à operadora'
                                      : 'Acione seguradora/rastreador, se houver',
                                ),
                                const _CheckRow(
                                  text: 'Avise pessoas próximas',
                                ),
                                const _CheckRow(
                                  text: 'Acompanhe atualizações no app',
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        // ✅ Contextual actions
                        _GlassCard(
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Column(
                              children: [
                                if (isPhone) ...[
                                  _ActionRow(
                                    icon: Icons.lock_outline,
                                    title:
                                        'Orientações para bloquear o aparelho',
                                    subtitle:
                                        'Como proceder com IMEI e operadora',
                                    onTap: () => _openUrl(
                                      context,
                                      'https://www.gov.br/pt-br/servicos/bloquear-aparelho-celular-roubado-ou-perdido',
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                                if (isVehicle) ...[
                                  _ActionRow(
                                    icon: Icons.shield_outlined,
                                    title: 'Avisar seguradora/rastreador',
                                    subtitle:
                                        'Entre em contato com seu serviço de proteção',
                                    onTap: () => _openUrl(
                                      context,
                                      'https://www.gov.br/pt-br/servicos', // placeholder seguro
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                ],
                                _ActionRow(
                                  icon: Icons.share_outlined,
                                  title: 'Compartilhar',
                                  subtitle: 'Ajude a alertar outras pessoas',
                                  onTap: _share,
                                ),
                                const SizedBox(height: 10),
                                _ActionRow(
                                  icon: Icons.local_police_outlined,
                                  title: 'Chamar a polícia',
                                  subtitle: 'Discar 190',
                                  onTap: () => _callPolice(context),
                                  highlight: true,
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        // ✅ Transparency: what happens now
                        _GlassCard(
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const _GlassHeader(
                                  icon: Icons.track_changes_outlined,
                                  title: 'O que acontece agora',
                                ),
                                const SizedBox(height: 10),
                                _Bullet(
                                  text:
                                      'Sua ocorrência foi registrada com sucesso.',
                                ),
                                _Bullet(
                                  text:
                                      'Ela poderá passar por validação antes de ganhar maior visibilidade.',
                                ),
                                _Bullet(
                                  text:
                                      'Você pode atualizar informações e acompanhar o status.',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),

                  // Primary CTA
                  SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      onPressed: onGoToDetails ?? () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: _blue,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: Text(
                        onGoToDetails != null ? 'Ver detalhes' : 'Concluir',
                        style: const TextStyle(fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Secondary: complete details (only for immediate)
                  if (isImmediate)
                    SizedBox(
                      height: 52,
                      child: OutlinedButton(
                        onPressed: onCompleteDetails ??
                            () {
                              Navigator.pop(context);
                            },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side:
                              BorderSide(color: Colors.white.withOpacity(0.35)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: const Text(
                          'Completar detalhes agora',
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ---------------- Components ---------------- */

class _TopIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _TopIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.14),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.white.withOpacity(0.18)),
        ),
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}

class _GlassCard extends StatelessWidget {
  final Widget child;
  const _GlassCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white.withOpacity(0.18)),
      ),
      child: child,
    );
  }
}

class _MiniPill extends StatelessWidget {
  final IconData icon;
  final String text;
  const _MiniPill({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.14),
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: Colors.white.withOpacity(0.16)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 16),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 12.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _GlassHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  const _GlassHeader({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.14),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.white.withOpacity(0.16)),
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 14.5,
            ),
          ),
        ),
      ],
    );
  }
}

class _GlassInlineInfo extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Widget? trailing;

  const _GlassInlineInfo({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.14),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Colors.white.withOpacity(0.16)),
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.92),
                  fontWeight: FontWeight.w600,
                  fontSize: 12.5,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
        if (trailing != null) ...[
          const SizedBox(width: 10),
          trailing!,
        ],
      ],
    );
  }
}

class _InlineChipButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _InlineChipButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(99),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.14),
          borderRadius: BorderRadius.circular(99),
          border: Border.all(color: Colors.white.withOpacity(0.18)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 16),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CheckRow extends StatelessWidget {
  final String text;
  const _CheckRow({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.16),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white.withOpacity(0.18)),
            ),
            child: const Icon(Icons.check, color: Colors.white, size: 16),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white.withOpacity(0.92),
                fontWeight: FontWeight.w700,
                fontSize: 12.8,
                height: 1.25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  final String text;
  const _Bullet({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white.withOpacity(0.92),
                fontWeight: FontWeight.w600,
                fontSize: 12.7,
                height: 1.25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool highlight;

  const _ActionRow({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    final bg = highlight
        ? Colors.white.withOpacity(0.16)
        : Colors.white.withOpacity(0.10);
    final border = highlight
        ? Colors.white.withOpacity(0.22)
        : Colors.white.withOpacity(0.16);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: border),
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.14),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.white.withOpacity(0.18)),
              ),
              child: Icon(icon, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.92),
                      fontWeight: FontWeight.w600,
                      fontSize: 12.5,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
