import 'package:flutter/material.dart';

enum ItemStatus { active, inactive, stolen, recovered }

enum PhonePlatformType { iphone, android }

class ItemPhonePageLight extends StatelessWidget {
  const ItemPhonePageLight({super.key});

  @override
  Widget build(BuildContext context) {
    final item = PhoneItemDetailsViewData(
      name: 'iPhone 13',
      brand: 'Apple',
      model: 'A2633',
      year: '2023',
      color: 'Preto',
      imei: '356789123456789',
      description:
          'Aparelho com película fosca, pequena marca na lateral e capa preta.',
      createdAtLabel: 'Cadastrado em 26 de março de 2026',
      status: ItemStatus.active,
      platformType: PhonePlatformType.iphone,
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: const Color(0xFFF6F8FB),
            surfaceTintColor: Colors.transparent,
            leading: Padding(
              padding: const EdgeInsets.only(left: 12, top: 6, bottom: 6),
              child: _TopCircleButton(
                icon: Icons.arrow_back_ios_new_rounded,
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
            title: const Text(
              'Detalhes do item',
              style: TextStyle(
                color: Color(0xFF111827),
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _PhoneHeroCard(item: item),
                  const SizedBox(height: 20),
                  _CurrentStatusCard(status: item.status),
                  const SizedBox(height: 20),
                  _SectionHeader(
                    title: 'Informações principaiss',
                    actionLabel: 'Editar',
                    onTap: () {},
                  ),
                  const SizedBox(height: 12),
                  _DefaultCard(
                    child: Column(
                      children: [
                        _InfoRow(
                            label: 'Tipo',
                            value: _platformLabel(item.platformType)),
                        _InfoRow(label: 'Nome do item', value: item.name),
                        _InfoRow(label: 'Marca', value: item.brand),
                        _InfoRow(label: 'Modelo', value: item.model),
                        _InfoRow(label: 'Ano', value: item.year),
                        _InfoRow(label: 'Cor', value: item.color),
                        _InfoRow(label: 'IMEI', value: item.imei, isLast: true),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _SectionHeader(
                    title: 'Descrição',
                    actionLabel: 'Editar',
                    onTap: () {},
                  ),
                  const SizedBox(height: 12),
                  _DefaultCard(
                    child: Text(
                      item.description?.trim().isNotEmpty == true
                          ? item.description!
                          : 'Nenhuma descrição adicionada.',
                      style: const TextStyle(
                        color: Color(0xFF374151),
                        fontSize: 14,
                        height: 1.55,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const _SectionHeader(title: 'Histórico do cadastro'),
                  const SizedBox(height: 12),
                  _DefaultCard(
                    child: Column(
                      children: [
                        _TimelineTile(
                          icon: Icons.check_circle_outline_rounded,
                          title: 'Item cadastrado com sucesso',
                          subtitle: item.createdAtLabel,
                        ),
                        const SizedBox(height: 18),
                        _TimelineTile(
                          icon: Icons.shield_outlined,
                          title: 'Status atual: ${_statusLabel(item.status)}',
                          subtitle: _statusDescription(item.status),
                          isLast: true,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  _DeleteCard(
                    onTapDelete: () {
                      showDialog<void>(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            surfaceTintColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            title: const Text(
                              'Excluir item?',
                              style: TextStyle(
                                color: Color(0xFF111827),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            content: const Text(
                              'Essa ação não poderá ser desfeita. Deseja continuar?',
                              style: TextStyle(
                                color: Color(0xFF6B7280),
                                height: 1.45,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text(
                                  'Cancelar',
                                  style: TextStyle(
                                    color: Color(0xFF6B7280),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              FilledButton(
                                style: FilledButton.styleFrom(
                                  backgroundColor: const Color(0xFF111827),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  'Excluir',
                                  style: TextStyle(fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PhoneItemDetailsViewData {
  final String name;
  final String brand;
  final String model;
  final String year;
  final String color;
  final String imei;
  final String? description;
  final String createdAtLabel;
  final ItemStatus status;
  final PhonePlatformType platformType;

  PhoneItemDetailsViewData({
    required this.name,
    required this.brand,
    required this.model,
    required this.year,
    required this.color,
    required this.imei,
    required this.description,
    required this.createdAtLabel,
    required this.status,
    required this.platformType,
  });
}

class _PhoneHeroCard extends StatelessWidget {
  final PhoneItemDetailsViewData item;

  const _PhoneHeroCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final isIphone = item.platformType == PhonePlatformType.iphone;

    return Container(
      width: double.infinity,
      height: 290,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          fit: StackFit.expand,
          children: [
            _PhoneBannerBackground(platformType: item.platformType),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: isIphone
                      ? [
                          Colors.black.withOpacity(0.08),
                          Colors.black.withOpacity(0.18),
                        ]
                      : [
                          Colors.white.withOpacity(0.06),
                          Colors.white.withOpacity(0.18),
                        ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _StatusBadge(status: item.status),
                  const SizedBox(height: 18),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: TextStyle(
                                color: isIphone
                                    ? Colors.white
                                    : const Color(0xFF111827),
                                fontWeight: FontWeight.w800,
                                fontSize: 26,
                                height: 1.05,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${_platformLabel(item.platformType)} • ${item.brand} • ${item.year}',
                              style: TextStyle(
                                color: isIphone
                                    ? Colors.white.withOpacity(0.82)
                                    : const Color(0xFF4B5563),
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      _PhoneMiniPreview(platformType: item.platformType),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 13,
                    ),
                    decoration: BoxDecoration(
                      color: isIphone
                          ? Colors.white.withOpacity(0.10)
                          : Colors.white.withOpacity(0.72),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isIphone
                            ? Colors.white.withOpacity(0.14)
                            : const Color(0xFFDCE4EF),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.fingerprint_rounded,
                          size: 18,
                          color: isIphone
                              ? Colors.white.withOpacity(0.86)
                              : const Color(0xFF6B7280),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'IMEI: ${item.imei}',
                            style: TextStyle(
                              color: isIphone
                                  ? Colors.white
                                  : const Color(0xFF111827),
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Sem fotos cadastradas para este aparelho.',
                    style: TextStyle(
                      color: isIphone
                          ? Colors.white.withOpacity(0.68)
                          : const Color(0xFF6B7280),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
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

class _PhoneBannerBackground extends StatelessWidget {
  final PhonePlatformType platformType;

  const _PhoneBannerBackground({required this.platformType});

  @override
  Widget build(BuildContext context) {
    final isIphone = platformType == PhonePlatformType.iphone;

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: isIphone
            ? const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF0B1220),
                  Color(0xFF111827),
                  Color(0xFF1F2937),
                ],
              )
            : const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFF3F6FA),
                  Color(0xFFE9EEF5),
                  Color(0xFFDDE5EE),
                ],
              ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -20,
            right: -20,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isIphone
                    ? Colors.white.withOpacity(0.05)
                    : Colors.white.withOpacity(0.55),
              ),
            ),
          ),
          Positioned(
            bottom: -35,
            left: -20,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isIphone
                    ? Colors.white.withOpacity(0.04)
                    : const Color(0xFFD4DEE9).withOpacity(0.70),
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Icon(
              platformType == PhonePlatformType.iphone
                  ? Icons.apple_rounded
                  : Icons.android_rounded,
              size: 96,
              color: isIphone
                  ? Colors.white.withOpacity(0.07)
                  : const Color(0xFFB7C3D0).withOpacity(0.55),
            ),
          ),
        ],
      ),
    );
  }
}

class _PhoneMiniPreview extends StatelessWidget {
  final PhonePlatformType platformType;

  const _PhoneMiniPreview({required this.platformType});

  @override
  Widget build(BuildContext context) {
    final isIphone = platformType == PhonePlatformType.iphone;

    return Container(
      width: 66,
      height: 118,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isIphone ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
        border: Border.all(
          color: isIphone
              ? Colors.white.withOpacity(0.18)
              : const Color(0xFFD7DFEA),
          width: 1.3,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isIphone ? 0.18 : 0.06),
            blurRadius: 14,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 8,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: isIphone ? 22 : 28,
                height: 4,
                decoration: BoxDecoration(
                  color: isIphone
                      ? Colors.white.withOpacity(0.16)
                      : const Color(0xFFCBD5E1),
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
            ),
          ),
          Center(
            child: Icon(
              platformType == PhonePlatformType.iphone
                  ? Icons.apple_rounded
                  : Icons.android_rounded,
              size: 28,
              color: isIphone
                  ? Colors.white.withOpacity(0.78)
                  : const Color(0xFF94A3B8),
            ),
          ),
        ],
      ),
    );
  }
}

class _CurrentStatusCard extends StatelessWidget {
  final ItemStatus status;

  const _CurrentStatusCard({required this.status});

  @override
  Widget build(BuildContext context) {
    return _DefaultCard(
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF1FF),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.verified_user_outlined,
              color: Color(0xFF2B5BEE),
              size: 22,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Status atual do item',
                  style: TextStyle(
                    color: Color(0xFF111827),
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _statusDescription(status),
                  style: const TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 13,
                    height: 1.45,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          _StatusBadge(status: status, compact: true),
        ],
      ),
    );
  }
}

class _DefaultCard extends StatelessWidget {
  final Widget child;

  const _DefaultCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFE5EAF2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String? actionLabel;
  final VoidCallback? onTap;

  const _SectionHeader({
    required this.title,
    this.actionLabel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              color: Color(0xFF111827),
              fontWeight: FontWeight.w800,
              fontSize: 17,
            ),
          ),
        ),
        if (actionLabel != null && onTap != null)
          TextButton(
            onPressed: onTap,
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFF2B5BEE),
              padding: EdgeInsets.zero,
              minimumSize: const Size(0, 32),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              actionLabel!,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isLast;

  const _InfoRow({
    required this.label,
    required this.value,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFF6B7280),
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Flexible(
                child: Text(
                  value,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Color(0xFF111827),
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    height: 1.35,
                  ),
                ),
              ),
            ],
          ),
          if (!isLast) ...[
            const SizedBox(height: 16),
            const Divider(
              height: 1,
              thickness: 1,
              color: Color(0xFFF0F3F8),
            ),
          ],
        ],
      ),
    );
  }
}

class _TimelineTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isLast;

  const _TimelineTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: const Color(0xFFEAF1FF),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Icon(
                icon,
                size: 18,
                color: const Color(0xFF2B5BEE),
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 36,
                margin: const EdgeInsets.symmetric(vertical: 6),
                color: const Color(0xFFE5EAF2),
              ),
          ],
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF111827),
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF6B7280),
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _DeleteCard extends StatelessWidget {
  final VoidCallback onTapDelete;

  const _DeleteCard({required this.onTapDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFF1D8DB)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.025),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Excluir item',
            style: TextStyle(
              color: Color(0xFFB42318),
              fontWeight: FontWeight.w800,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Remova este item do seu cadastro. Essa ação não poderá ser desfeita.',
            style: TextStyle(
              color: Color(0xFF6B7280),
              fontWeight: FontWeight.w500,
              fontSize: 13,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: onTapDelete,
              icon: const Icon(Icons.delete_outline_rounded, size: 18),
              label: const Text(
                'Excluir este item',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFFB42318),
                backgroundColor: const Color(0xFFFFFBFB),
                side: const BorderSide(color: Color(0xFFEAC2C7)),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TopCircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _TopCircleButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 40,
          height: 40,
          child: Icon(
            icon,
            size: 18,
            color: const Color(0xFF111827),
          ),
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final ItemStatus status;
  final bool compact;

  const _StatusBadge({
    required this.status,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = _statusStyle(status);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 10 : 12,
        vertical: compact ? 7 : 8,
      ),
      decoration: BoxDecoration(
        color: style.backgroundColor,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: style.borderColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(style.icon,
              size: compact ? 14 : 16, color: style.foregroundColor),
          const SizedBox(width: 6),
          Text(
            style.label,
            style: TextStyle(
              color: style.foregroundColor,
              fontWeight: FontWeight.w700,
              fontSize: compact ? 12 : 13,
            ),
          ),
        ],
      ),
    );
  }
}

_StatusStyle _statusStyle(ItemStatus status) {
  switch (status) {
    case ItemStatus.active:
      return _StatusStyle(
        label: 'Ativo',
        icon: Icons.check_circle_outline_rounded,
        foregroundColor: const Color(0xFF0F8A4B),
        backgroundColor: const Color(0xFFEAF8F0),
        borderColor: const Color(0xFFCFEEDB),
      );
    case ItemStatus.inactive:
      return _StatusStyle(
        label: 'Inativo',
        icon: Icons.pause_circle_outline_rounded,
        foregroundColor: const Color(0xFF6B7280),
        backgroundColor: const Color(0xFFF3F4F6),
        borderColor: const Color(0xFFE5E7EB),
      );
    case ItemStatus.stolen:
      return _StatusStyle(
        label: 'Em ocorrência',
        icon: Icons.warning_amber_rounded,
        foregroundColor: const Color(0xFFC2410C),
        backgroundColor: const Color(0xFFFFF1E8),
        borderColor: const Color(0xFFF6D7C3),
      );
    case ItemStatus.recovered:
      return _StatusStyle(
        label: 'Recuperado',
        icon: Icons.verified_rounded,
        foregroundColor: const Color(0xFF155EEF),
        backgroundColor: const Color(0xFFEAF1FF),
        borderColor: const Color(0xFFD7E4FF),
      );
  }
}

class _StatusStyle {
  final String label;
  final IconData icon;
  final Color foregroundColor;
  final Color backgroundColor;
  final Color borderColor;

  _StatusStyle({
    required this.label,
    required this.icon,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.borderColor,
  });
}

String _platformLabel(PhonePlatformType type) {
  switch (type) {
    case PhonePlatformType.iphone:
      return 'iPhone';
    case PhonePlatformType.android:
      return 'Android';
  }
}

String _statusLabel(ItemStatus status) {
  switch (status) {
    case ItemStatus.active:
      return 'Ativo';
    case ItemStatus.inactive:
      return 'Inativo';
    case ItemStatus.stolen:
      return 'Em ocorrência';
    case ItemStatus.recovered:
      return 'Recuperado';
  }
}

String _statusDescription(ItemStatus status) {
  switch (status) {
    case ItemStatus.active:
      return 'Este item está ativo e disponível para uso no aplicativo.';
    case ItemStatus.inactive:
      return 'Este item está inativo no momento.';
    case ItemStatus.stolen:
      return 'Existe uma ocorrência vinculada a este item.';
    case ItemStatus.recovered:
      return 'O item foi marcado como recuperado.';
  }
}

// import 'package:flutter/material.dart';

// enum ItemStatus { active, inactive, stolen, recovered }

// class ItemPhonePageLight extends StatelessWidget {
//   const ItemPhonePageLight({super.key});

//   static const Color primaryColor = Color(0xFF2B5BEE);

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     final item = RegisteredItemDetailsViewData(
//       typeLabel: 'Celular',
//       name: 'iPhone 13',
//       brand: 'Apple',
//       year: '2023',
//       color: 'Preto',
//       imei: '356789123456789',
//       description:
//           'Aparelho com pequena marca na lateral, película fosca e capa preta.',
//       status: ItemStatus.active,
//       createdAtLabel: 'Cadastrado em 26 de março de 2026',
//     );

//     return Scaffold(
//       backgroundColor: const Color(0xFFF6F8FB),
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             pinned: true,
//             elevation: 0,
//             backgroundColor: const Color(0xFFF6F8FB),
//             surfaceTintColor: Colors.transparent,
//             leading: _CircleActionButton(
//               icon: Icons.arrow_back_ios_new_rounded,
//               onTap: () => Navigator.of(context).pop(),
//             ),
//             title: Text(
//               'Detalhes do item',
//               style: theme.textTheme.titleMedium?.copyWith(
//                 color: const Color(0xFF111827),
//                 fontWeight: FontWeight.w800,
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   _PhoneHeroCard(item: item),
//                   const SizedBox(height: 20),
//                   _InfoHighlightCard(
//                     title: 'Status atual do item',
//                     subtitle: _statusDescription(item.status),
//                     trailing: _StatusPillCompact(status: item.status),
//                   ),
//                   const SizedBox(height: 20),
//                   _SectionTitle(
//                     title: 'Informações principais',
//                     actionLabel: 'Editar',
//                     onTap: () {},
//                   ),
//                   const SizedBox(height: 12),
//                   _DetailsCard(
//                     children: [
//                       _DetailRow(label: 'Tipo', value: item.typeLabel),
//                       _DetailRow(label: 'Nome do item', value: item.name),
//                       _DetailRow(label: 'Marca', value: item.brand),
//                       _DetailRow(label: 'Ano', value: item.year),
//                       _DetailRow(label: 'Cor', value: item.color),
//                       _DetailRow(
//                         label: 'IMEI',
//                         value: item.imei,
//                         isLast: true,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   _SectionTitle(
//                     title: 'Descrição',
//                     actionLabel: 'Editar',
//                     onTap: () {},
//                   ),
//                   const SizedBox(height: 12),
//                   _DetailsCard(
//                     children: [
//                       Text(
//                         item.description?.isNotEmpty == true
//                             ? item.description!
//                             : 'Nenhuma descrição adicionada.',
//                         style: theme.textTheme.bodyMedium?.copyWith(
//                           color: const Color(0xFF374151),
//                           height: 1.55,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   _SectionTitle(title: 'Histórico do cadastro'),
//                   const SizedBox(height: 12),
//                   _DetailsCard(
//                     children: [
//                       _TimelineRow(
//                         icon: Icons.check_circle_outline_rounded,
//                         title: 'Item cadastrado com sucesso',
//                         subtitle: item.createdAtLabel,
//                       ),
//                       const SizedBox(height: 16),
//                       _TimelineRow(
//                         icon: Icons.shield_outlined,
//                         title: 'Status atual: ${_statusLabel(item.status)}',
//                         subtitle: 'O item está disponível para acompanhamento.',
//                         isLast: true,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 28),
//                   Container(
//                     width: double.infinity,
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(22),
//                       border: Border.all(color: const Color(0xFFF1D6DA)),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Excluir item',
//                           style: theme.textTheme.titleSmall?.copyWith(
//                             color: const Color(0xFFB42318),
//                             fontWeight: FontWeight.w800,
//                           ),
//                         ),
//                         const SizedBox(height: 6),
//                         Text(
//                           'Remova este item do seu cadastro. Essa ação não poderá ser desfeita.',
//                           style: theme.textTheme.bodySmall?.copyWith(
//                             color: const Color(0xFF6B7280),
//                             height: 1.45,
//                           ),
//                         ),
//                         const SizedBox(height: 14),
//                         SizedBox(
//                           width: double.infinity,
//                           child: OutlinedButton.icon(
//                             onPressed: () {},
//                             style: OutlinedButton.styleFrom(
//                               foregroundColor: const Color(0xFFB42318),
//                               side: const BorderSide(
//                                 color: Color(0xFFE7B9C0),
//                               ),
//                               backgroundColor: const Color(0xFFFFFBFB),
//                               padding: const EdgeInsets.symmetric(vertical: 15),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(16),
//                               ),
//                             ),
//                             icon: const Icon(Icons.delete_outline_rounded),
//                             label: const Text(
//                               'Excluir este item',
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   static String _statusLabel(ItemStatus status) {
//     switch (status) {
//       case ItemStatus.active:
//         return 'Ativo';
//       case ItemStatus.inactive:
//         return 'Inativo';
//       case ItemStatus.stolen:
//         return 'Em ocorrência';
//       case ItemStatus.recovered:
//         return 'Recuperado';
//     }
//   }

//   static String _statusDescription(ItemStatus status) {
//     switch (status) {
//       case ItemStatus.active:
//         return 'Este item está ativo e pronto para uso no aplicativo.';
//       case ItemStatus.inactive:
//         return 'Este item está inativo no momento.';
//       case ItemStatus.stolen:
//         return 'Existe uma ocorrência vinculada a este item.';
//       case ItemStatus.recovered:
//         return 'O item foi marcado como recuperado.';
//     }
//   }
// }

// class RegisteredItemDetailsViewData {
//   final String typeLabel;
//   final String name;
//   final String brand;
//   final String year;
//   final String color;
//   final String imei;
//   final String? description;
//   final ItemStatus status;
//   final String createdAtLabel;

//   RegisteredItemDetailsViewData({
//     required this.typeLabel,
//     required this.name,
//     required this.brand,
//     required this.year,
//     required this.color,
//     required this.imei,
//     required this.description,
//     required this.status,
//     required this.createdAtLabel,
//   });
// }

// class _PhoneHeroCard extends StatelessWidget {
//   final RegisteredItemDetailsViewData item;

//   const _PhoneHeroCard({required this.item});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         color: const Color(0xFFF2F6FF),
//         borderRadius: BorderRadius.circular(28),
//         border: Border.all(color: const Color(0xFFDCE6FF)),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.04),
//             blurRadius: 20,
//             offset: const Offset(0, 10),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _StatusBadgeLight(status: item.status),
//           const SizedBox(height: 16),
//           Container(
//             width: 64,
//             height: 64,
//             decoration: BoxDecoration(
//               color: const Color(0xFFEAF1FF), // azul bem suave
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: const Icon(
//               Icons.smartphone_rounded,
//               color: Color(0xFF2B5BEE),
//               size: 30,
//             ),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             item.name,
//             style: theme.textTheme.titleLarge?.copyWith(
//               fontWeight: FontWeight.w800,
//               color: const Color(0xFF111827),
//             ),
//           ),
//           const SizedBox(height: 6),
//           Text(
//             '${item.typeLabel} • ${item.brand} • ${item.year}',
//             style: theme.textTheme.bodyMedium?.copyWith(
//               color: const Color(0xFF6B7280),
//             ),
//           ),
//           const SizedBox(height: 14),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//             decoration: BoxDecoration(
//               color: const Color(0xFFF6F8FB),
//               borderRadius: BorderRadius.circular(14),
//             ),
//             child: Row(
//               children: [
//                 const Icon(
//                   Icons.fingerprint_rounded,
//                   size: 18,
//                   color: Color(0xFF6B7280),
//                 ),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: Text(
//                     'IMEI: ${item.imei}',
//                     style: theme.textTheme.bodyMedium?.copyWith(
//                       fontWeight: FontWeight.w700,
//                       color: const Color(0xFF111827),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _CircleActionButton extends StatelessWidget {
//   final IconData icon;
//   final VoidCallback onTap;

//   const _CircleActionButton({
//     required this.icon,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 6),
//       child: Material(
//         color: Colors.white,
//         shape: const CircleBorder(),
//         child: InkWell(
//           customBorder: const CircleBorder(),
//           onTap: onTap,
//           child: SizedBox(
//             width: 40,
//             height: 40,
//             child: Icon(
//               icon,
//               size: 18,
//               color: const Color(0xFF111827),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _StatusBadgeLight extends StatelessWidget {
//   final ItemStatus status;

//   const _StatusBadgeLight({required this.status});

//   @override
//   Widget build(BuildContext context) {
//     final config = _statusConfig(status);

//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//       decoration: BoxDecoration(
//         color: config.backgroundColor,
//         borderRadius: BorderRadius.circular(999),
//         border: Border.all(color: config.borderColor),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(config.icon, size: 16, color: config.foregroundColor),
//           const SizedBox(width: 6),
//           Text(
//             config.label,
//             style: TextStyle(
//               color: config.foregroundColor,
//               fontWeight: FontWeight.w700,
//               fontSize: 13,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _StatusPillCompact extends StatelessWidget {
//   final ItemStatus status;

//   const _StatusPillCompact({required this.status});

//   @override
//   Widget build(BuildContext context) {
//     final config = _statusConfig(status);

//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
//       decoration: BoxDecoration(
//         color: config.backgroundColor,
//         borderRadius: BorderRadius.circular(999),
//         border: Border.all(color: config.borderColor),
//       ),
//       child: Text(
//         config.label,
//         style: TextStyle(
//           color: config.foregroundColor,
//           fontSize: 12,
//           fontWeight: FontWeight.w700,
//         ),
//       ),
//     );
//   }
// }

// class _InfoHighlightCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final Widget trailing;

//   const _InfoHighlightCard({
//     required this.title,
//     required this.subtitle,
//     required this.trailing,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Container(
//       padding: const EdgeInsets.all(18),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(22),
//         border: Border.all(color: const Color(0xFFE5EAF2)),
//       ),
//       child: Row(
//         children: [
//           Container(
//             width: 48,
//             height: 48,
//             decoration: BoxDecoration(
//               color: const Color(0xFFEAF1FF),
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: const Icon(
//               Icons.verified_user_outlined,
//               color: ItemPhonePageLight.primaryColor,
//             ),
//           ),
//           const SizedBox(width: 14),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: theme.textTheme.titleSmall?.copyWith(
//                     color: const Color(0xFF111827),
//                     fontWeight: FontWeight.w800,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   subtitle,
//                   style: theme.textTheme.bodySmall?.copyWith(
//                     color: const Color(0xFF6B7280),
//                     height: 1.45,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 12),
//           trailing,
//         ],
//       ),
//     );
//   }
// }

// class _SectionTitle extends StatelessWidget {
//   final String title;
//   final String? actionLabel;
//   final VoidCallback? onTap;

//   const _SectionTitle({
//     required this.title,
//     this.actionLabel,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Row(
//       children: [
//         Expanded(
//           child: Text(
//             title,
//             style: theme.textTheme.titleMedium?.copyWith(
//               color: const Color(0xFF111827),
//               fontWeight: FontWeight.w800,
//             ),
//           ),
//         ),
//         if (actionLabel != null && onTap != null)
//           TextButton(
//             onPressed: onTap,
//             style: TextButton.styleFrom(
//               foregroundColor: ItemPhonePageLight.primaryColor,
//               padding: EdgeInsets.zero,
//               minimumSize: const Size(0, 32),
//               tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//             ),
//             child: Text(
//               actionLabel!,
//               style: const TextStyle(fontWeight: FontWeight.w700),
//             ),
//           ),
//       ],
//     );
//   }
// }

// class _DetailsCard extends StatelessWidget {
//   final List<Widget> children;

//   const _DetailsCard({required this.children});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(18),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(22),
//         border: Border.all(color: const Color(0xFFE5EAF2)),
//       ),
//       child: Column(children: children),
//     );
//   }
// }

// class _DetailRow extends StatelessWidget {
//   final String label;
//   final String value;
//   final bool isLast;

//   const _DetailRow({
//     required this.label,
//     required this.value,
//     this.isLast = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Padding(
//       padding: EdgeInsets.only(bottom: isLast ? 0 : 16),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: Text(
//                   label,
//                   style: theme.textTheme.bodySmall?.copyWith(
//                     color: const Color(0xFF6B7280),
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 16),
//               Flexible(
//                 child: Text(
//                   value,
//                   textAlign: TextAlign.right,
//                   style: theme.textTheme.bodyMedium?.copyWith(
//                     color: const Color(0xFF111827),
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           if (!isLast) ...[
//             const SizedBox(height: 16),
//             const Divider(
//               height: 1,
//               thickness: 1,
//               color: Color(0xFFF0F3F8),
//             ),
//           ],
//         ],
//       ),
//     );
//   }
// }

// class _TimelineRow extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final String subtitle;
//   final bool isLast;

//   const _TimelineRow({
//     required this.icon,
//     required this.title,
//     required this.subtitle,
//     this.isLast = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Column(
//           children: [
//             Container(
//               width: 36,
//               height: 36,
//               decoration: BoxDecoration(
//                 color: const Color(0xFFEAF1FF),
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Icon(
//                 icon,
//                 color: ItemPhonePageLight.primaryColor,
//                 size: 18,
//               ),
//             ),
//             if (!isLast)
//               Container(
//                 width: 2,
//                 height: 34,
//                 margin: const EdgeInsets.symmetric(vertical: 6),
//                 color: const Color(0xFFE5EAF2),
//               ),
//           ],
//         ),
//         const SizedBox(width: 14),
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 6),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: theme.textTheme.bodyMedium?.copyWith(
//                     color: const Color(0xFF111827),
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   subtitle,
//                   style: theme.textTheme.bodySmall?.copyWith(
//                     color: const Color(0xFF6B7280),
//                     height: 1.45,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// _StatusConfig _statusConfig(ItemStatus status) {
//   switch (status) {
//     case ItemStatus.active:
//       return _StatusConfig(
//         label: 'Ativo',
//         icon: Icons.check_circle_outline_rounded,
//         foregroundColor: const Color(0xFF0F8A4B),
//         backgroundColor: const Color(0xFFEAF8F0),
//         borderColor: const Color(0xFFCFEEDB),
//       );
//     case ItemStatus.inactive:
//       return _StatusConfig(
//         label: 'Inativo',
//         icon: Icons.pause_circle_outline_rounded,
//         foregroundColor: const Color(0xFF6B7280),
//         backgroundColor: const Color(0xFFF3F4F6),
//         borderColor: const Color(0xFFE5E7EB),
//       );
//     case ItemStatus.stolen:
//       return _StatusConfig(
//         label: 'Em ocorrência',
//         icon: Icons.warning_amber_rounded,
//         foregroundColor: const Color(0xFFC2410C),
//         backgroundColor: const Color(0xFFFFF1E8),
//         borderColor: const Color(0xFFF8D8C2),
//       );
//     case ItemStatus.recovered:
//       return _StatusConfig(
//         label: 'Recuperado',
//         icon: Icons.verified_rounded,
//         foregroundColor: const Color(0xFF155EEF),
//         backgroundColor: const Color(0xFFEAF1FF),
//         borderColor: const Color(0xFFD7E4FF),
//       );
//   }
// }

// class _StatusConfig {
//   final String label;
//   final IconData icon;
//   final Color foregroundColor;
//   final Color backgroundColor;
//   final Color borderColor;

//   _StatusConfig({
//     required this.label,
//     required this.icon,
//     required this.foregroundColor,
//     required this.backgroundColor,
//     required this.borderColor,
//   });
// }
