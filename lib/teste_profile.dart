import 'package:deehelp/core/extension/size_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemDetailsPage extends StatefulWidget {
  final ItemDetailsModel item;

  const ItemDetailsPage({
    super.key,
    required this.item,
  });

  @override
  State<ItemDetailsPage> createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  late final PageController _pageController;
  int _currentImage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 390,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: _DetailsImagesCarousel(
                      imageUrls: item.imageUrls,
                      pageController: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentImage = index;
                        });
                      },
                    ),
                  ),
                  Positioned.fill(
                    child: IgnorePointer(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withValues(alpha: 0.10),
                              Colors.black.withValues(alpha: 0.18),
                              Colors.black.withValues(alpha: 0.45),
                              Colors.black.withValues(alpha: 0.78),
                              Colors.black,
                            ],
                            stops: const [0.0, 0.18, 0.45, 0.78, 1.0],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: topPadding + 12,
                    left: 12,
                    child: _TopCircleButton(
                      icon: CupertinoIcons.back,
                      onTap: () => Navigator.of(context).pop(),
                    ),
                  ),
                  if (item.imageUrls.length > 1)
                    Positioned(
                      bottom: 24,
                      left: 0,
                      right: 0,
                      child: _ImagePagerDots(
                        count: item.imageUrls.length,
                        currentIndex: _currentImage,
                      ),
                    ),
                  Positioned(
                    bottom: 70,
                    right: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.55),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.zoom_in,
                            size: 14.sp,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Ampliar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: context.safeSp(11),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Transform.translate(
              offset: const Offset(0, -24),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF050505),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 18, 24, 120),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 54,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        item.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.9,
                          height: 1.0,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Row(
                        children: [
                          StatusBadge2(status: item.status),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              item.createdAtLabel,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Color(0xFF8D8D93),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 28),
                      _DetailsSectionCard(
                        title: 'Resumo',
                        child: Column(
                          children: [
                            EditableInfoRow(
                              label: item.identifierLabel,
                              value: item.identifierValue,
                              onEdit: item.onEditIdentifier,
                            ),
                            InfoRow(
                              label: 'Cor',
                              value: item.color,
                            ),
                            InfoRow(
                              label: item.extraLabel1,
                              value: item.extraValue1,
                            ),
                            InfoRow(
                              label: 'Cadastro',
                              value: item.createdAtLabel,
                              isLast: true,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
                      _DetailsSectionCard(
                        title: 'Última localização',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  CupertinoIcons.location_solid,
                                  color: Color(0xFF8F98FF),
                                  size: 18,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    item.lastLocation,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      height: 1.3,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (item.lastUpdateLabel != null &&
                                item.lastUpdateLabel!.isNotEmpty) ...[
                              const SizedBox(height: 10),
                              Text(
                                item.lastUpdateLabel!,
                                style: const TextStyle(
                                  color: Color(0xFF8D8D93),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(height: 18),
                      _DetailsSectionCard(
                        title: 'Observações',
                        child: Text(
                          item.notes?.trim().isNotEmpty == true
                              ? item.notes!
                              : 'Nenhuma observação cadastrada para este item.',
                          style: const TextStyle(
                            color: Color(0xFFE7E7EA),
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            height: 1.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),
                      const Text(
                        'Danger Zone',
                        style: TextStyle(
                          color: Color(0xFFFF7373),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.3,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _DangerZoneCard(
                        title: 'Excluir item',
                        subtitle:
                            'Essa ação remove este item do seu cadastro e não poderá ser desfeita.',
                        onDelete: item.onDelete,
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

class _DetailsImagesCarousel extends StatelessWidget {
  final List<String> imageUrls;
  final PageController pageController;
  final ValueChanged<int> onPageChanged;

  const _DetailsImagesCarousel({
    required this.imageUrls,
    required this.pageController,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrls.isEmpty) {
      return Container(
        color: const Color(0xFF111214),
        child: const Center(
          child: Icon(
            CupertinoIcons.photo,
            color: Colors.white38,
            size: 46,
          ),
        ),
      );
    }

    return PageView.builder(
      controller: pageController,
      physics: const BouncingScrollPhysics(),
      itemCount: imageUrls.length,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) {
        final imageUrl = imageUrls[index];

        return _DetailsImageItem(
          imageUrl: imageUrl,
        );
      },
    );
  }
}

class _DetailsImageItem extends StatelessWidget {
  final String imageUrl;

  const _DetailsImageItem({
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl.trim().isEmpty) {
      return Container(
        color: const Color(0xFF111214),
        child: const Center(
          child: Icon(
            CupertinoIcons.photo,
            color: Colors.white38,
            size: 46,
          ),
        ),
      );
    }

    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;

        return Container(
          color: const Color(0xFF111214),
          child: const Center(
            child: CircularProgressIndicator.adaptive(
              valueColor: AlwaysStoppedAnimation(Color(0xFF8F98FF)),
            ),
          ),
        );
      },
      errorBuilder: (_, __, ___) {
        return Container(
          color: const Color(0xFF111214),
          child: const Center(
            child: Icon(
              CupertinoIcons.photo,
              color: Colors.white38,
              size: 46,
            ),
          ),
        );
      },
    );
  }
}

class _ImagePagerDots extends StatelessWidget {
  final int count;
  final int currentIndex;

  const _ImagePagerDots({
    required this.count,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) {
          final selected = index == currentIndex;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOut,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: selected ? 18 : 7,
            height: 7,
            decoration: BoxDecoration(
              color: selected ? Colors.white : Colors.white38,
              borderRadius: BorderRadius.circular(999),
            ),
          );
        },
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
      color: Colors.black.withValues(alpha: 0.34),
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: const SizedBox(
          width: 42,
          height: 42,
          child: Icon(
            CupertinoIcons.back,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}

class _DetailsSectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _DetailsSectionCard({
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
      decoration: BoxDecoration(
        color: const Color(0xFF101012),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: const Color(0xFF1D1D21),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF9A9AA0),
              fontSize: 13,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isLast;

  const InfoRow({
    super.key,
    required this.label,
    required this.value,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 14),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFF8D8D93),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Flexible(
                child: Text(
                  value,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                  ),
                ),
              ),
            ],
          ),
          if (!isLast) ...[
            const SizedBox(height: 14),
            const Divider(
              color: Color(0xFF1C1C1E),
              height: 1,
            ),
          ],
        ],
      ),
    );
  }
}

class EditableInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback? onEdit;

  const EditableInfoRow({
    super.key,
    required this.label,
    required this.value,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFF8D8D93),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        value,
                        textAlign: TextAlign.right,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    _InlineCircleIconButton(
                      icon: CupertinoIcons.pencil,
                      onTap: onEdit,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Divider(
            color: Color(0xFF1C1C1E),
            height: 1,
          ),
        ],
      ),
    );
  }
}

class _InlineCircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _InlineCircleIconButton({
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF1A1A1F),
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 28,
          height: 28,
          child: Icon(
            icon,
            color: Colors.white,
            size: 14,
          ),
        ),
      ),
    );
  }
}

class _DangerZoneCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onDelete;

  const _DangerZoneCard({
    required this.title,
    required this.subtitle,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF151010),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: const Color(0xFF3A1E22),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: const Color(0xFFEF4444).withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              CupertinoIcons.trash,
              color: Color(0xFFEF4444),
              size: 19,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFFFF7B7B),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFFB8A7A7),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          TextButton(
            onPressed: onDelete,
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFFEF4444),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            ),
            child: const Text(
              'Excluir',
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemDetailsModel {
  final String name;
  final ItemStatus status;
  final String createdAtLabel;
  final String identifierLabel;
  final String identifierValue;
  final String color;
  final String extraLabel1;
  final String extraValue1;
  final String lastLocation;
  final String? lastUpdateLabel;
  final String? notes;
  final List<String> imageUrls;
  final VoidCallback? onDelete;
  final VoidCallback? onEditIdentifier;

  const ItemDetailsModel({
    required this.name,
    required this.status,
    required this.createdAtLabel,
    required this.identifierLabel,
    required this.identifierValue,
    required this.color,
    required this.extraLabel1,
    required this.extraValue1,
    required this.lastLocation,
    required this.imageUrls,
    this.lastUpdateLabel,
    this.notes,
    this.onDelete,
    this.onEditIdentifier,
  });
}

class ItemStatusColors {
  static const active = Color(0xFF22C55E);
  static const stolen = Color(0xFFEF4444);
  static const pending = Color(0xFFF59E0B);
  static const canceled = Color(0xFF6B7280);
}

enum ItemStatus {
  active,
  stolen,
  pending,
  canceled,
}

class StatusBadge2 extends StatelessWidget {
  final ItemStatus status;

  const StatusBadge2({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    String text;
    Color color;

    switch (status) {
      case ItemStatus.active:
        text = 'ATIVO';
        color = ItemStatusColors.active;
        break;
      case ItemStatus.stolen:
        text = 'ROUBADO';
        color = ItemStatusColors.stolen;
        break;
      case ItemStatus.pending:
        text = 'PENDENTE';
        color = ItemStatusColors.pending;
        break;
      case ItemStatus.canceled:
        text = 'CANCELADO';
        color = ItemStatusColors.canceled;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: color, width: 1.3),
        color: color.withValues(alpha: 0.08),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w700,
          fontSize: 12,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
