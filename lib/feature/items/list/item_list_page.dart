import 'package:deehelp/core/extension/color_extension.dart';
import 'package:deehelp/core/theme/export_theme.dart';
import 'package:deehelp/core/ui/widgets/appbar/default_app_bar.dart';
import 'package:deehelp/core/ui/widgets/badge/export_badge.dart';
import 'package:deehelp/core/ui/widgets/buttons/buttons_export.dart';
import 'package:deehelp/feature/items/items_router.dart';
import 'package:deehelp/feature/items/list/widgets/header_summary.dart';
import 'package:deehelp/feature/items/list/widgets/row_item_card.dart';
import 'package:deehelp/feature/items/list/widgets/verification_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

List<UserItem> _mockItems() {
  return [
    UserItem(
      id: '1',
      name: 'CG Titan 150',
      status: ItemStatus.active,
      createdAt: DateTime(2026, 1, 18),
      photo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRufY0qbfB0C-IUYAZuu3kZ7LVTbmWSCtuJnw&s",
    ),
    UserItem(
      id: '2',
      name: 'iPhone 13',
      status: ItemStatus.pending,
      createdAt: DateTime(2026, 1, 29),
      photo:
          "https://uploads.vrum.com.br/2023/05/242f7368-toyota-etios-hatch-vermelho-modelo-2012-primeira-geracao-de-traseita-estatico-no-estudio.jpg",
    ),
    UserItem(
      id: '3',
      name: 'Toyota Corolla',
      status: ItemStatus.canceled,
      createdAt: DateTime(2025, 12, 6),
      photo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbSRgF9O-5VxpxrlZ-yR3JsYWmoZfJdHnOTw&s",
    ),
  ];
}

class UserItem {
  final String id;
  final String name;
  final ItemStatus status;
  final DateTime createdAt;
  final String photo;

  const UserItem({
    required this.id,
    required this.name,
    required this.status,
    required this.createdAt,
    required this.photo,
  });
}

class ItemListPage extends StatelessWidget {
  const ItemListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = _mockItems();
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x142B5BEE),
              blurRadius: 16,
              offset: Offset(0, -6),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: ButtonOutline(
            press: () => context.push(ItemsRouter.register),
            bgColor: context.primaryColor,
            textColor: Colors.white,
            icon: const Icon(
              Icons.add_circle_outline,
              color: Colors.white,
            ),
            text: "Cadastrar novo item",
          ),
        ),
      ),
      appBar: DefaultAppBar(
        title: "Meus itens",
        press: () => context.pop(),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        children: [
          const HeaderSummary(total: 3),
          const SizedBox(height: SpacingSize.md),
          const VerificationInfoCard(),
          const SizedBox(height: SpacingSize.md),
          ...items.map(
            (it) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: RowItemCard(
                item: it,
                onTap: () => context.push(ItemsRouter.detail),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
