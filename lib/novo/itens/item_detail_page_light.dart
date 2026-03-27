import 'package:flutter/material.dart';

enum ItemStatus { active, inactive, stolen, recovered }

class ItemDetailPageLight extends StatelessWidget {
  const ItemDetailPageLight({super.key});

  static const Color primaryColor = Color(0xFF2B5BEE);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final item = RegisteredItemDetailsViewData(
      typeLabel: 'Carro',
      name: 'Onix LT 1.0',
      brand: 'Chevrolet',
      year: '2022',
      color: 'Preto',
      plateOrCodeLabel: 'Placa',
      plateOrCodeValue: 'BRA2E19',
      imei: null,
      description:
          'Veículo com risco na porta dianteira esquerda, pequeno amassado no para-choque traseiro e película escura nos vidros.',
      status: ItemStatus.active,
      createdAtLabel: 'Cadastrado em 26 de março de 2026',
      photos: const [
        'https://images.unsplash.com/photo-1503376780353-7e6692767b70?q=80&w=1200&auto=format&fit=crop',
        'https://images.unsplash.com/photo-1494976388531-d1058494cdd8?q=80&w=1200&auto=format&fit=crop',
        'https://images.unsplash.com/photo-1552519507-da3b142c6e3d?q=80&w=1200&auto=format&fit=crop',
      ],
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 310,
            pinned: true,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            leading: _CircleActionButton(
              icon: Icons.arrow_back_ios_new_rounded,
              onTap: () => Navigator.of(context).pop(),
            ),
            actions: [
              _CircleActionButton(
                icon: Icons.edit_outlined,
                onTap: () {
                  debugPrint('Editar item');
                },
              ),
              const SizedBox(width: 12),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  PageView.builder(
                    itemCount: item.photos.length,
                    itemBuilder: (context, index) {
                      return Image.network(
                        item.photos[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.12),
                          Colors.transparent,
                          Colors.black.withOpacity(0.28),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    right: 20,
                    bottom: 24,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _StatusBadgeLight(status: item.status),
                        const SizedBox(height: 12),
                        Text(
                          item.name,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            height: 1.1,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '${item.typeLabel} • ${item.brand} • ${item.year}',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: Colors.white.withOpacity(0.92),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _InfoHighlightCard(
                    icon: Icons.verified_user_outlined,
                    title: 'Status atual do item',
                    subtitle: _statusDescription(item.status),
                    trailing: _StatusPillCompact(status: item.status),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: _QuickActionCard(
                          icon: Icons.edit_note_rounded,
                          title: 'Editar',
                          subtitle: 'Atualize as informações do item',
                          onTap: () {
                            debugPrint('Editar');
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _QuickActionCard(
                          icon: Icons.photo_library_outlined,
                          title: 'Fotos',
                          subtitle: 'Visualize todas as imagens',
                          onTap: () {
                            debugPrint('Ver fotos');
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _SectionTitle(
                    title: 'Informações principais',
                    actionLabel: 'Editar',
                    onTap: () {
                      debugPrint('Editar informações principais');
                    },
                  ),
                  const SizedBox(height: 12),
                  _DetailsCard(
                    children: [
                      _DetailRow(
                        label: 'Tipo',
                        value: item.typeLabel,
                      ),
                      _DetailRow(
                        label: 'Nome do item',
                        value: item.name,
                      ),
                      _DetailRow(
                        label: 'Marca',
                        value: item.brand,
                      ),
                      _DetailRow(
                        label: 'Ano',
                        value: item.year,
                      ),
                      _DetailRow(
                        label: 'Cor',
                        value: item.color,
                      ),
                      _DetailRow(
                        label: item.plateOrCodeLabel,
                        value: item.plateOrCodeValue,
                        isLast: item.imei == null,
                      ),
                      if (item.imei != null)
                        _DetailRow(
                          label: 'IMEI',
                          value: item.imei!,
                          isLast: true,
                        ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _SectionTitle(
                    title: 'Descrição',
                    actionLabel: 'Editar',
                    onTap: () {
                      debugPrint('Editar descrição');
                    },
                  ),
                  const SizedBox(height: 12),
                  _DetailsCard(
                    children: [
                      Text(
                        item.description?.isNotEmpty == true
                            ? item.description!
                            : 'Nenhuma descrição adicionada.',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: const Color(0xFF374151),
                          height: 1.55,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _SectionTitle(title: 'Galeria'),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 110,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: item.photos.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Stack(
                            children: [
                              Image.network(
                                item.photos[index],
                                width: 130,
                                height: 110,
                                fit: BoxFit.cover,
                              ),
                              Positioned.fill(
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      debugPrint('Abrir foto $index');
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  _SectionTitle(title: 'Histórico do cadastro'),
                  const SizedBox(height: 12),
                  _DetailsCard(
                    children: [
                      _TimelineRow(
                        icon: Icons.check_circle_outline_rounded,
                        title: 'Item cadastrado com sucesso',
                        subtitle: item.createdAtLabel,
                      ),
                      const SizedBox(height: 16),
                      _TimelineRow(
                        icon: Icons.shield_outlined,
                        title: 'Status atual: ${_statusLabel(item.status)}',
                        subtitle: 'O item está disponível para acompanhamento.',
                        isLast: true,
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () {
                        debugPrint('Editar item');
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      icon: const Icon(Icons.edit_rounded),
                      label: const Text(
                        'Editar item',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        debugPrint('Alterar status');
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF111827),
                        side: const BorderSide(color: Color(0xFFD8DEE8)),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      icon: const Icon(Icons.sync_alt_rounded),
                      label: const Text(
                        'Alterar status do item',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static String _statusLabel(ItemStatus status) {
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

  static String _statusDescription(ItemStatus status) {
    switch (status) {
      case ItemStatus.active:
        return 'Este item está ativo e pronto para uso no aplicativo.';
      case ItemStatus.inactive:
        return 'Este item está inativo no momento.';
      case ItemStatus.stolen:
        return 'Existe uma ocorrência vinculada a este item.';
      case ItemStatus.recovered:
        return 'O item foi marcado como recuperado.';
    }
  }
}

class RegisteredItemDetailsViewData {
  final String typeLabel;
  final String name;
  final String brand;
  final String year;
  final String color;
  final String plateOrCodeLabel;
  final String plateOrCodeValue;
  final String? imei;
  final String? description;
  final ItemStatus status;
  final String createdAtLabel;
  final List<String> photos;

  RegisteredItemDetailsViewData({
    required this.typeLabel,
    required this.name,
    required this.brand,
    required this.year,
    required this.color,
    required this.plateOrCodeLabel,
    required this.plateOrCodeValue,
    required this.imei,
    required this.description,
    required this.status,
    required this.createdAtLabel,
    required this.photos,
  });
}

class _CircleActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleActionButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Material(
        color: Colors.white.withOpacity(0.92),
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
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
      ),
    );
  }
}

class _StatusBadgeLight extends StatelessWidget {
  final ItemStatus status;

  const _StatusBadgeLight({required this.status});

  @override
  Widget build(BuildContext context) {
    final config = _statusConfig(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: config.backgroundColor,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: config.borderColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            config.icon,
            size: 16,
            color: config.foregroundColor,
          ),
          const SizedBox(width: 6),
          Text(
            config.label,
            style: TextStyle(
              color: config.foregroundColor,
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusPillCompact extends StatelessWidget {
  final ItemStatus status;

  const _StatusPillCompact({required this.status});

  @override
  Widget build(BuildContext context) {
    final config = _statusConfig(status);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: config.backgroundColor,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: config.borderColor),
      ),
      child: Text(
        config.label,
        style: TextStyle(
          color: config.foregroundColor,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _InfoHighlightCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Widget trailing;

  const _InfoHighlightCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFE5EAF2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
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
              color: ItemDetailPageLight.primaryColor,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: const Color(0xFF111827),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF6B7280),
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          trailing,
        ],
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(22),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: const Color(0xFFE5EAF2)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 14,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF1FF),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  icon,
                  color: ItemDetailPageLight.primaryColor,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                title,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: const Color(0xFF111827),
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: const Color(0xFF6B7280),
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final String? actionLabel;
  final VoidCallback? onTap;

  const _SectionTitle({
    required this.title,
    this.actionLabel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              color: const Color(0xFF111827),
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        if (actionLabel != null && onTap != null)
          TextButton(
            onPressed: onTap,
            style: TextButton.styleFrom(
              foregroundColor: ItemDetailPageLight.primaryColor,
              padding: EdgeInsets.zero,
              minimumSize: const Size(0, 32),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              actionLabel!,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
      ],
    );
  }
}

class _DetailsCard extends StatelessWidget {
  final List<Widget> children;

  const _DetailsCard({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFE5EAF2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 16,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }
}

class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isLast;

  const _DetailRow({
    required this.label,
    required this.value,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF6B7280),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Flexible(
                child: Text(
                  value,
                  textAlign: TextAlign.right,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF111827),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          if (!isLast) ...[
            const SizedBox(height: 16),
            Divider(
              height: 1,
              thickness: 1,
              color: const Color(0xFFF0F3F8),
            ),
          ],
        ],
      ),
    );
  }
}

class _TimelineRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isLast;

  const _TimelineRow({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: const Color(0xFFEAF1FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: ItemDetailPageLight.primaryColor,
                size: 18,
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 34,
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
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: const Color(0xFF111827),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: const Color(0xFF6B7280),
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

_StatusConfig _statusConfig(ItemStatus status) {
  switch (status) {
    case ItemStatus.active:
      return _StatusConfig(
        label: 'Ativo',
        icon: Icons.check_circle_outline_rounded,
        foregroundColor: const Color(0xFF0F8A4B),
        backgroundColor: const Color(0xFFEAF8F0),
        borderColor: const Color(0xFFCFEEDB),
      );
    case ItemStatus.inactive:
      return _StatusConfig(
        label: 'Inativo',
        icon: Icons.pause_circle_outline_rounded,
        foregroundColor: const Color(0xFF6B7280),
        backgroundColor: const Color(0xFFF3F4F6),
        borderColor: const Color(0xFFE5E7EB),
      );
    case ItemStatus.stolen:
      return _StatusConfig(
        label: 'Em ocorrência',
        icon: Icons.warning_amber_rounded,
        foregroundColor: const Color(0xFFC2410C),
        backgroundColor: const Color(0xFFFFF1E8),
        borderColor: const Color(0xFFF8D8C2),
      );
    case ItemStatus.recovered:
      return _StatusConfig(
        label: 'Recuperado',
        icon: Icons.verified_rounded,
        foregroundColor: const Color(0xFF155EEF),
        backgroundColor: const Color(0xFFEAF1FF),
        borderColor: const Color(0xFFD7E4FF),
      );
  }
}

class _StatusConfig {
  final String label;
  final IconData icon;
  final Color foregroundColor;
  final Color backgroundColor;
  final Color borderColor;

  _StatusConfig({
    required this.label,
    required this.icon,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.borderColor,
  });
}
