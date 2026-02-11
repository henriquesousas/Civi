import 'package:app_core/app_core.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:flutter/material.dart';

/// ===============================
/// SOS PAGE (Premium + Clean)
/// ===============================
class TesteSOSPage extends StatelessWidget {
  const TesteSOSPage({super.key});

  @override
  Widget build(BuildContext context) {
    final contacts = _defaultEmergencyContacts();

    return Scaffold(
      backgroundColor: UIK.bg,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0.6,
        backgroundColor: UIK.surface,
        surfaceTintColor: UIK.surface,
        title: const Text(
          'SOS',
          style: TextStyle(fontWeight: FontWeight.w900, color: UIK.ink),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding:
              const EdgeInsets.fromLTRB(UIK.s16, UIK.s16, UIK.s16, UIK.s24),
          children: [
            _SosHeaderCard(
              title: 'Contatos de emergência',
              subtitle:
                  'Use apenas em situações reais. Em caso de risco imediato, ligue para o serviço adequado.',
              onTapTips: () {
                // TODO: abrir modal com dicas rápidas (opcional)
              },
            ),
            const SizedBox(height: UIK.s16),
            _SectionHeader(
              title: 'Serviços essenciais',
              subtitle: 'Liga direto para o atendimento',
              trailing: TextButton(
                onPressed: () {
                  // TODO: abrir tela/diálogo para editar "Outros contatos"
                },
                child: const Text('Editar'),
              ),
            ),
            const SizedBox(height: UIK.s12),
            ...contacts.map(
              (c) => Padding(
                padding: const EdgeInsets.only(bottom: UIK.s12),
                child: SosContactCard(
                  contact: c,
                  onCall: () {
                    // TODO: Ligar (tel:)
                    // ex: launchUrl(Uri.parse('tel:${c.phone}'));
                  },
                ),
              ),
            ),
            const SizedBox(height: UIK.s20),
            _SectionHeader(
              title: 'Outros contatos',
              subtitle: 'Adicione familiares, vizinhos ou segurança do bairro',
              trailing: TextButton(
                onPressed: () {
                  // TODO: navegar para tela de gerenciar contatos
                },
                child: const Text('Adicionar'),
              ),
            ),
            const SizedBox(height: UIK.s12),
            _OtherContactsHint(),
          ],
        ),
      ),
    );
  }
}

/// ===============================
/// UI TOKENS
/// ===============================
class UIK {
  static const primary = Color(0xFF2B5BEE);
  static const bg = Color(0xFFF7F9FC);
  static const surface = Colors.white;
  static const ink = Color(0xFF1F2A44);
  static const muted = Color(0xFF6B7280);
  static const border = Color(0xFFE9EEF8);

  static const danger = Color(0xFFE53935);

  static const rCard = 20.0;
  static const rButton = 18.0;

  static const s12 = 12.0;
  static const s16 = 16.0;
  static const s20 = 20.0;
  static const s24 = 24.0;

  static const shadowSoft = BoxShadow(
    color: Color(0x12000000),
    blurRadius: 18,
    offset: Offset(0, 10),
  );
}

/// ===============================
/// HEADER CARD
/// ===============================
class _SosHeaderCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTapTips;

  const _SosHeaderCard({
    required this.title,
    required this.subtitle,
    required this.onTapTips,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: UIK.primary,
        borderRadius: BorderRadius.circular(UIK.rCard),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1F2157F8),
            blurRadius: 18,
            offset: Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(UIK.s16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.16),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white.withOpacity(0.18)),
            ),
            child: const Icon(Icons.sos_rounded, color: Colors.white),
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
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.88),
                    fontSize: 12.8,
                    fontWeight: FontWeight.w600,
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: onTapTips,
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                        side: BorderSide(color: Colors.white.withOpacity(0.28)),
                      ),
                    ),
                    icon: const Icon(Icons.info_outline_rounded, size: 18),
                    label: const Text(
                      'Dicas rápidas',
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// ===============================
/// SECTION HEADER
/// ===============================
class _SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? trailing;

  const _SectionHeader({
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15.5,
                  fontWeight: FontWeight.w900,
                  color: UIK.ink,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 12.5, color: UIK.muted),
              ),
            ],
          ),
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}

/// ===============================
/// CONTACT CARD
/// ===============================
class SosContactCard extends StatelessWidget {
  final SosContact contact;
  final VoidCallback onCall;

  const SosContactCard({
    super.key,
    required this.contact,
    required this.onCall,
  });

  @override
  Widget build(BuildContext context) {
    final accent = contact.accentColor;
    return Container(
      decoration: BoxDecoration(
        color: UIK.surface,
        borderRadius: BorderRadius.circular(UIK.rCard),
        border: Border.all(color: UIK.border),
        boxShadow: const [UIK.shadowSoft],
      ),
      padding: const EdgeInsets.all(UIK.s16),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: accent.withOpacity(0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(contact.icon, color: accent),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contact.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: UIK.ink,
                    fontSize: 14.8,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  contact.subtitle,
                  style: const TextStyle(
                    color: UIK.muted,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Icon(
            Icons.phone,
            color: AppColors.primaryColor.withValues(alpha: 0.9),
          ),
          // Expanded(
          //   child: SizedBox(
          //     height: 40,
          //     child: ElevatedButton.icon(
          //       onPressed: onCall,
          //       style: ElevatedButton.styleFrom(
          //         backgroundColor: accent,
          //         foregroundColor: Colors.white,
          //         elevation: 0,
          //         padding: const EdgeInsets.symmetric(horizontal: 12),
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(14),
          //         ),
          //       ),
          //       icon: const Icon(Icons.call_rounded, size: 18),
          //       label: Text(
          //         contact.phone,
          //         style: const TextStyle(fontWeight: FontWeight.w900),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

/// ===============================
/// OUTROS CONTATOS (placeholder)
/// ===============================
class _OtherContactsHint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: UIK.surface,
        borderRadius: BorderRadius.circular(UIK.rCard),
        border: Border.all(color: UIK.border),
        boxShadow: const [UIK.shadowSoft],
      ),
      padding: const EdgeInsets.all(UIK.s16),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: UIK.primary.withOpacity(0.10),
              borderRadius: BorderRadius.circular(16),
            ),
            child:
                const Icon(Icons.person_add_alt_1_rounded, color: UIK.primary),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Adicione contatos confiáveis',
                  style: TextStyle(fontWeight: FontWeight.w900, color: UIK.ink),
                ),
                SizedBox(height: 4),
                Text(
                  'Ex: familiar, vizinho, porteiro, segurança do bairro.',
                  style: TextStyle(
                    color: UIK.muted,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          const Icon(Icons.chevron_right_rounded, color: UIK.muted),
        ],
      ),
    );
  }
}

/// ===============================
/// MODEL + DEFAULT CONTACTS
/// ===============================
class SosContact {
  final String title;
  final String subtitle;
  final String phone;
  final IconData icon;
  final Color accentColor;

  const SosContact({
    required this.title,
    required this.subtitle,
    required this.phone,
    required this.icon,
    required this.accentColor,
  });
}

List<SosContact> _defaultEmergencyContacts() => const [
      SosContact(
        title: 'Polícia',
        subtitle: 'Emergência policial',
        phone: '190',
        icon: Icons.local_police_rounded,
        accentColor: Color(0xFF2B5BEE),
      ),
      SosContact(
        title: 'SAMU',
        subtitle: 'Emergência médica',
        phone: '192',
        icon: Icons.medical_services_rounded,
        accentColor: Color(0xFF16A34A),
      ),
      SosContact(
        title: 'Bombeiro',
        subtitle: 'Incêndio, resgate e acidentes',
        phone: '193',
        icon: Icons.local_fire_department_rounded,
        accentColor: Color(0xFFE53935),
      ),
      SosContact(
        title: 'Defesa Civil',
        subtitle: 'Riscos, enchentes e desastres',
        phone: '199',
        icon: Icons.flood_rounded,
        accentColor: Color(0xFFF59E0B),
      ),
      SosContact(
        title: 'Disque Denúncia',
        subtitle: 'Denúncias anônimas',
        phone: '181',
        icon: Icons.campaign_rounded,
        accentColor: Color(0xFF6B7280),
      ),
    ];
