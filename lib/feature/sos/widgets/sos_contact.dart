import 'package:flutter/material.dart';

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

  static List<SosContact> defaultEmergencyContacts() => const [
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
}
