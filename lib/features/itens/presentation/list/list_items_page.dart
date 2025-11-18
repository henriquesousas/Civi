import 'package:deehelp/core/components/ui_app_bar.dart';
import 'package:deehelp/features/itens/domain/entities/my_items.dart';
import 'package:deehelp/features/itens/presentation/list/bloc/list_product_state.dart';
import 'package:deehelp/features/itens/presentation/list/components/item_add_new_widget.dart';
import 'package:deehelp/shared/animation/fade_slide_transition_animator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/empty_state_widget.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/theme/app_colors.dart';
import 'bloc/list_product_cubit.dart';
import 'components/item_card_widget.dart';
import 'components/item_filter_widget.dart';

enum ItemType {
  carro,
  moto,
  caminhao,
  celular,
  usuario,
}

// class Item {
//   final String id;
//   final String name;
//   final String imageUrl;
//   final ItemType type;
//   final String status;
//   final int year;
//   final String? plate; // Apenas para veículos
//   final String? model; // Para celulares e outros
//   final String? owner; // Para itens de outras pessoas
//   final bool isOwnedByUser; // Se é do próprio usuário
//
//   Item({
//     required this.id,
//     required this.name,
//     required this.imageUrl,
//     required this.type,
//     required this.status,
//     required this.year,
//     this.plate,
//     this.model,
//     this.owner,
//     required this.isOwnedByUser,
//   });
// }

// class ItemTypeHelper {
//   static String label(ItemType type) {
//     switch (type) {
//       case ItemType.carro:
//         return 'Carro';
//       case ItemType.moto:
//         return 'Moto';
//       case ItemType.caminhao:
//         return 'Caminhão';
//       case ItemType.celular:
//         return 'Celular';
//       case ItemType.usuario:
//         return 'Usuário';
//     }
//   }
//
//   static Color color(ItemType type) {
//     switch (type) {
//       case ItemType.carro:
//         return Color(0xFF3B82F6); // Azul
//       case ItemType.moto:
//         return Color(0xFF8B5CF6); // Roxo
//       case ItemType.caminhao:
//         return Color(0xFFF59E0B); // Âmbar
//       case ItemType.celular:
//         return Color(0xFF10B981); // Verde
//       case ItemType.usuario:
//         return Color(0xFF6B7280); // Cinza
//     }
//   }
//
//   static IconData icon(ItemType type) {
//     switch (type) {
//       case ItemType.carro:
//         return Icons.directions_car;
//       case ItemType.moto:
//         return Icons.motorcycle;
//       case ItemType.caminhao:
//         return Icons.local_shipping;
//       case ItemType.celular:
//         return Icons.phone_iphone;
//       case ItemType.usuario:
//         return Icons.person;
//     }
//   }
// }

// class StatusHelper {
//   static Color color(String status) {
//     switch (status) {
//       case 'ativo':
//         return Color(0xFF10B981);
//       case 'pendente':
//         return Color(0xFFF59E0B);
//       case 'cancelado':
//         return Color(0xFFEF4444);
//       case 'manutencao':
//         return Color(0xFF8B5CF6);
//       case 'inativo':
//         return Color(0xFF6B7280);
//       default:
//         return Colors.grey;
//     }
//   }

//   static String label(String status) {
//     switch (status) {
//       case 'ativo':
//         return 'Ativo';
//       case 'pendente':
//         return 'Pendente';
//       case 'cancelado':
//         return 'Cancelado';
//       case 'manutencao':
//         return 'Manutenção';
//       case 'inativo':
//         return 'Inativo';
//       default:
//         return status;
//     }
//   }
//
//   static IconData icon(String status) {
//     switch (status) {
//       case 'ativo':
//         return Icons.check_circle;
//       case 'pendente':
//         return Icons.pending;
//       case 'cancelado':
//         return Icons.cancel;
//       case 'manutencao':
//         return Icons.build;
//       case 'inativo':
//         return Icons.pause_circle;
//       default:
//         return Icons.help;
//     }
//   }
// }

/// Badge de tipo do item
// class TypeBadge extends StatelessWidget {
//   final ItemType type;
//
//   const TypeBadge({super.key, required this.type});
//
//   @override
//   Widget build(BuildContext context) {
//     final typeColor = ItemTypeHelper.color(type);
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//       decoration: BoxDecoration(
//         color: Colors.grey.withValues(alpha: 0.1), //typeColor.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: Colors.grey.withOpacity(0.3), width: 1),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(
//             ItemTypeHelper.icon(type),
//             size: 12,
//             color: Colors.grey[700] ?? Colors.grey,
//           ),
//           const SizedBox(width: 4),
//           Text(
//             "DND-0171",
//             // ItemTypeHelper.label(type),
//             style: Theme.of(context).textTheme.labelSmall?.copyWith(
//                   color: Colors.grey[700] ?? Colors.grey,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 10,
//                 ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// /// Badge de status
// class StatusBadge extends StatelessWidget {
//   final String status;
//
//   const StatusBadge({super.key, required this.status});
//
//   @override
//   Widget build(BuildContext context) {
//     final statusColor = StatusHelper.color(status);
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//       decoration: BoxDecoration(
//         color: statusColor.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: statusColor.withOpacity(0.3), width: 1),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(
//             StatusHelper.icon(status),
//             size: 12,
//             color: statusColor,
//           ),
//           const SizedBox(width: 4),
//           Text(
//             StatusHelper.label(status),
//             style: Theme.of(context).textTheme.labelSmall?.copyWith(
//                   color: statusColor,
//                   fontWeight: FontWeight.w600,
//                   fontSize: 10,
//                 ),
//           ),
//         ],
//       ),
//     );
//   }
// }

/// Badge de propriedade
// class OwnershipBadge extends StatelessWidget {
//   final bool isOwnedByUser;
//
//   const OwnershipBadge({super.key, required this.isOwnedByUser});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
//       decoration: BoxDecoration(
//         color: isOwnedByUser
//             ? Color(0xFF10B981).withOpacity(0.1)
//             : Color(0xFFF59E0B).withOpacity(0.1),
//         borderRadius: BorderRadius.circular(6),
//         border: Border.all(
//           color: isOwnedByUser
//               ? Color(0xFF10B981).withOpacity(0.3)
//               : Color(0xFFF59E0B).withOpacity(0.3),
//           width: 1,
//         ),
//       ),
//       child: Text(
//         isOwnedByUser ? 'Meu' : 'Terceiro',
//         style: Theme.of(context).textTheme.labelSmall?.copyWith(
//               color: isOwnedByUser ? Color(0xFF10B981) : Color(0xFFF59E0B),
//               fontWeight: FontWeight.w600,
//               fontSize: 9,
//             ),
//       ),
//     );
//   }
// }

/// Card principal da plataforma
// class PlatformItemCard extends StatelessWidget {
//   final Item item;
//   final VoidCallback onDelete;
//   final VoidCallback onEdit;
//   final VoidCallback onTap;
//
//   const PlatformItemCard({
//     super.key,
//     required this.item,
//     required this.onDelete,
//     required this.onEdit,
//     required this.onTap,
//   });
//
//   void _showOptions(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.white,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//       ),
//       builder: (ctx) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 width: 40,
//                 height: 4,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[300],
//                   borderRadius: BorderRadius.circular(2),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 'Opções - ${item.name}',
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.black87,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               const Divider(height: 1, color: Color(0xFFF3F4F6)),
//               _buildOptionItem(
//                 context: ctx,
//                 icon: Icons.edit_outlined,
//                 title:
//                     'Editar ${ItemTypeHelper.label(item.type).toLowerCase()}',
//                 color: Color(0xFF6B7280),
//                 onTap: onEdit,
//               ),
//               _buildOptionItem(
//                 context: ctx,
//                 icon: Icons.delete_outline,
//                 title:
//                     'Excluir ${ItemTypeHelper.label(item.type).toLowerCase()}',
//                 color: Color(0xFFEF4444),
//                 onTap: onDelete,
//               ),
//               _buildOptionItem(
//                 context: ctx,
//                 icon: Icons.history,
//                 title: 'Ver histórico',
//                 color: Color(0xFF6B7280),
//                 onTap: () {},
//               ),
//               _buildOptionItem(
//                 context: ctx,
//                 icon: Icons.info_outline,
//                 title: 'Detalhes completos',
//                 color: Color(0xFF6B7280),
//                 onTap: onTap,
//               ),
//               const SizedBox(height: 16),
//             ],
//           ),
//         );
//       },
//     );
//   }

Widget _buildOptionItem({
  required BuildContext context,
  required IconData icon,
  required String title,
  required Color color,
  required VoidCallback onTap,
}) {
  return ListTile(
    leading: Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: color, size: 20),
    ),
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
    ),
    trailing: Icon(Icons.chevron_right, color: Colors.grey[400], size: 20),
    contentPadding: const EdgeInsets.symmetric(vertical: 4),
    onTap: () {
      Navigator.pop(context);
      onTap();
    },
  );
}

// Widget _buildItemImage() {
//   return Stack(
//     children: [
//       Container(
//         width: 100,
//         height: 100,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.08),
//               blurRadius: 12,
//               offset: const Offset(0, 4),
//             ),
//           ],
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(16),
//           child: Image.network(
//             item.imageUrl,
//             fit: BoxFit.cover,
//             loadingBuilder: (context, child, progress) {
//               if (progress == null) return child;
//               return _buildImagePlaceholder();
//             },
//             errorBuilder: (context, error, stack) {
//               return _buildImagePlaceholder();
//             },
//           ),
//         ),
//       ),
//       // Badge do ano no canto da imagem
//       Positioned(
//         top: 8,
//         right: 8,
//         child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
//           decoration: BoxDecoration(
//             color: Colors.black.withOpacity(0.8),
//             borderRadius: BorderRadius.circular(6),
//           ),
//           child: Text(
//             '${item.year}',
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 9,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//       ),
//     ],
//   );
// }

// Widget _buildImagePlaceholder() {
//   return Container(
//     decoration: BoxDecoration(
//       color: Colors.grey[300],
//       borderRadius: BorderRadius.circular(16),
//     ),
//     child: Icon(ItemTypeHelper.icon(item.type),
//         color: Colors.grey[500], size: 40),
//   );
// }

// Widget _buildHeaderRow(BuildContext context) {
//   return Row(
//     children: [
//       Expanded(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                     item.name,
//                     style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                           fontWeight: FontWeight.w700,
//                           fontSize: 18,
//                           color: Colors.black87,
//                         ),
//                   ),
//                 ),
//                 OwnershipBadge(isOwnedByUser: item.isOwnedByUser),
//               ],
//             ),
//             const SizedBox(height: 4),
//             if (item.plate != null)
//               Text(
//                 'Placa: ${item.plate!}',
//                 style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                       color: Colors.grey[600],
//                       fontWeight: FontWeight.w500,
//                     ),
//               ),
//             if (item.model != null)
//               Text(
//                 'Modelo: ${item.model!}',
//                 style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                       color: Colors.grey[600],
//                       fontWeight: FontWeight.w500,
//                     ),
//               ),
//             if (item.owner != null)
//               Text(
//                 'Proprietário: ${item.owner!}',
//                 style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                       color: Colors.grey[600],
//                       fontWeight: FontWeight.w500,
//                     ),
//               ),
//           ],
//         ),
//       ),
//       _buildMenuButton(context),
//     ],
//   );
// }
//
// Widget _buildMenuButton(BuildContext context) {
//   return Container(
//     width: 36,
//     height: 36,
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(10),
//       border: Border.all(color: Colors.grey[300]!),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(0.05),
//           blurRadius: 4,
//           offset: const Offset(0, 1),
//         ),
//       ],
//     ),
//     child: IconButton(
//       icon: Icon(Icons.more_vert, size: 18, color: Colors.grey[600]),
//       onPressed: () => _showOptions(context),
//       padding: EdgeInsets.zero,
//     ),
//   );
// }
//
// Widget _buildInfoRow() {
//   return Row(
//     children: [
//       TypeBadge(type: item.type),
//       const SizedBox(width: 8),
//       Expanded(
//         child: StatusBadge(status: item.status),
//       ),
//       _buildQuickActions(),
//     ],
//   );
// }
//
// Widget _buildQuickActions() {
//   return Row(
//     children: [
//       _buildActionButton(Icons.visibility, 'Detalhes', onTap),
//       const SizedBox(width: 8),
//       _buildActionButton(Icons.history, 'Histórico', () {}),
//     ],
//   );
// }

//   Widget _buildActionButton(IconData icon, String tooltip, VoidCallback onTap) {
//     return Tooltip(
//       message: tooltip,
//       child: Container(
//         width: 32,
//         height: 32,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(color: Colors.grey[300]!),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.05),
//               blurRadius: 4,
//               offset: const Offset(0, 1),
//             ),
//           ],
//         ),
//         child: IconButton(
//           icon: Icon(icon, size: 16, color: Colors.grey[600]),
//           onPressed: onTap,
//           padding: EdgeInsets.zero,
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       margin: const EdgeInsets.symmetric(vertical: 6),
//       decoration: BoxDecoration(
//         color: Color(0xFFF8FAFC),
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.04),
//             blurRadius: 12,
//             offset: const Offset(0, 3),
//           ),
//         ],
//         border: Border.all(color: Colors.grey[100]!),
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           borderRadius: BorderRadius.circular(20),
//           onTap: (){},
//           splashColor: Colors.grey[200],
//           highlightColor: Colors.grey[100],
//           child: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Row(
//               children: [
//                 _buildItemImage(),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       _buildHeaderRow(context),
//                       const SizedBox(height: 12),
//                       _buildInfoRow(),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

/// Filtro por tipo
// class TypeFilterBar extends StatelessWidget {
//   final String selectedFilter;
//   final ValueChanged<String> onFilterChanged;
//
//   const TypeFilterBar({
//     super.key,
//     required this.selectedFilter,
//     required this.onFilterChanged,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final filters = [
//       'Todos',
//       'Carros',
//       'Motos',
//       'Caminhões',
//       'Celulares',
//       'Usuários'
//     ];
//
//     return Container(
//       height: 48,
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: filters.length,
//         itemBuilder: (context, index) {
//           final filter = filters[index];
//           final isSelected = selectedFilter == filter;
//
//           return Container(
//             margin: const EdgeInsets.only(right: 8),
//             child: Material(
//               color: Colors.transparent,
//               child: InkWell(
//                 borderRadius: BorderRadius.circular(16),
//                 onTap: () => onFilterChanged(filter),
//                 child: Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//                   decoration: BoxDecoration(
//                     color: isSelected ? Color(0xFF1F2937) : Colors.transparent,
//                     borderRadius: BorderRadius.circular(16),
//                     border: Border.all(
//                       color: isSelected ? Color(0xFF1F2937) : Colors.grey[300]!,
//                       width: 1.5,
//                     ),
//                   ),
//                   child: Text(
//                     filter,
//                     style: TextStyle(
//                       color: isSelected ? Colors.white : Colors.grey[700],
//                       fontWeight: FontWeight.w600,
//                       fontSize: 13,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

/// Search Bar
// class PlatformSearchBar extends StatelessWidget {
//   final ValueChanged<String> onSearchChanged;
//   final VoidCallback onFilterTap;
//
//   const PlatformSearchBar({
//     super.key,
//     required this.onSearchChanged,
//     required this.onFilterTap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.04),
//             blurRadius: 8,
//             offset: const Offset(0, 2),
//           ),
//         ],
//         border: Border.all(color: Colors.grey[200]!),
//       ),
//       child: Row(
//         children: [
//           Icon(Icons.search, color: Colors.grey[500]),
//           const SizedBox(width: 12),
//           Expanded(
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Buscar por nome, placa, modelo...',
//                 border: InputBorder.none,
//                 hintStyle: TextStyle(color: Colors.grey[400]),
//               ),
//               onChanged: onSearchChanged,
//               style: const TextStyle(color: Colors.black87),
//             ),
//           ),
//           IconButton(
//             icon:
//                 Icon(Icons.filter_list_alt, color: Colors.grey[600], size: 20),
//             onPressed: onFilterTap,
//             padding: EdgeInsets.zero,
//           ),
//         ],
//       ),
//     );
//   }
// }

/// Empty State
// class EmptyItemsState extends StatelessWidget {
//   final VoidCallback onAddItem;
//
//   const EmptyItemsState({super.key, required this.onAddItem});
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(40),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: 120,
//               height: 120,
//               decoration: BoxDecoration(
//                 color: Color(0xFFF8FAFC),
//                 shape: BoxShape.circle,
//                 border: Border.all(color: Colors.grey[200]!, width: 1),
//               ),
//               child: Icon(Icons.inventory_2_outlined,
//                   size: 50, color: Colors.grey[400]),
//             ),
//             const SizedBox(height: 24),
//             const Text(
//               'Nenhum item cadastrado',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600,
//                 color: Colors.grey,
//               ),
//             ),
//             const SizedBox(height: 12),
//             const Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Text(
//                 'Comece adicionando seu primeiro item à plataforma para gerenciar seus veículos, celulares e outros itens',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.grey,
//                   height: 1.5,
//                   fontSize: 14,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 24),
//             ElevatedButton(
//               onPressed: onAddItem,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color(0xFF1F2937),
//                 foregroundColor: Colors.white,
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//               ),
//               child: const Text(
//                 'Adicionar Primeiro Item',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class ListItemPage extends StatefulWidget {
  const ListItemPage({super.key});

  @override
  State<ListItemPage> createState() => _ListItemPageState();
}

class _ListItemPageState extends State<ListItemPage> {
  final List<Item> _allItems = [
    // Veículos do usuário
    // Item(
    //     id: '1',
    //     name: 'HB20 Comfort',
    //     imageUrl:
    //         'https://cdn.autopapo.com.br/box/uploads/2023/02/17205728/volkswagen-polo-track-2023-prata-frente-em-movimento-rodovia-4.jpg',
    //     // type: ItemType.carro,
    //     status: ItemStatus.active,
    //     year: 2022,
    //     type: "carro",
    //     code: 'DND-0171',
    //     userId: '123'
    //
    //     // plate: 'ABC-1234',
    //     // isOwnedByUser: true,
    //     ),
    // Item(
    //     id: '2',
    //     name: 'Honda CG 160',
    //     imageUrl:
    //         'https://www.estadao.com.br/resizer/v2/L7QA5Z5GJNIJVN7FWLRE7B73DQ.jpg?quality=80&auth=736fe4e022409a758c99ed6fd310688d99b2cdcc81c627f23d5dfe76d09c53a3&width=1262&height=710&smart=true',
    //     // type: ItemType.moto,
    //     status: ItemStatus.pending,
    //     year: 2021,
    //     type: "carro",
    //     code: 'DND-0171',
    //     userId: '123'
    //     // plate: 'MOT-5678',
    //     // isOwnedByUser: true,
    //     ),
    //
    // // Veículos de terceiros
    // Item(
    //     id: '3',
    //     name: 'Volvo FH 540',
    //     imageUrl: 'https://example.com/volvo.jpg',
    //     type: "caminhao",
    //     status: ItemStatus.inactive,
    //     year: 2021,
    //     code: 'DND-0171',
    //     userId: '123'
    //     // plate: 'CAM-9012',
    //     // owner: 'Transportadora ABC',
    //     // isOwnedByUser: false,
    //     ),
    //
    // // Celulares
    // Item(
    //   id: '4',
    //   name: 'iPhone 15 Pro',
    //   imageUrl: 'https://example.com/iphone15.jpg',
    //   // type: ItemType.celular,
    //   status: ItemStatus.active,
    //   year: 2021,
    //   code: 'DND-0171',
    //   userId: '123',
    //   type: 'Celular',
    // ),
    // Item(
    //   id: '5',
    //   name: 'Samsung S23',
    //   imageUrl: 'https://example.com/s23.jpg',
    //   status: ItemStatus.inactive,
    //   year: 2021,
    //   code: 'DND-0171',
    //   userId: '123',
    //   type: 'Celular',
    // ),
  ];

  List<Item> _filteredItems = [];
  String _searchQuery = '';
  String _selectedFilter = 'Todos';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      _filteredItems = _allItems;
      _isLoading = false;
    });
  }

  void _filterItems() {
    List<Item> filtered = _allItems;

    // Aplicar filtro de busca
    if (_searchQuery.isNotEmpty) {
      // filtered = filtered
      //     .where((item) =>
      //         item.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
      //         (item.plate?.toLowerCase().contains(_searchQuery.toLowerCase()) ??
      //             false) ||
      //         (item.model?.toLowerCase().contains(_searchQuery.toLowerCase()) ??
      //             false) ||
      //         (item.owner?.toLowerCase().contains(_searchQuery.toLowerCase()) ??
      //             false))
      //     .toList();
    }

    // Aplicar filtro de tipo
    if (_selectedFilter != 'Todos') {
      final typeMap = {
        'Carros': ItemType.carro,
        'Motos': ItemType.moto,
        'Caminhões': ItemType.caminhao,
        'Celulares': ItemType.celular,
        'Usuários': ItemType.usuario,
      };
      final type = typeMap[_selectedFilter];
      if (type != null) {
        filtered = filtered.where((item) => item.type == type).toList();
      }
    }

    setState(() {
      _filteredItems = filtered;
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
    _filterItems();
  }

  void _onFilterChanged(String filter) {
    setState(() {
      _selectedFilter = filter;
    });
    _filterItems();
  }

  // void _deleteItem(int index) {
  //   final item = _filteredItems[index];
  //   final originalIndex = _allItems.indexOf(item);
  //
  //   setState(() {
  //     _allItems.removeAt(originalIndex);
  //   });
  //   _filterItems();
  //
  //   ScaffoldMessenger.of(context).showSnackBar(
  //       // SnackBar(
  //       //   content:
  //       //       Text('${ItemTypeHelper.label(item.type)} ${item.name} excluído'),
  //       //   backgroundColor: Color(0xFF1F2937),
  //       //   behavior: SnackBarBehavior.floating,
  //       //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  //       //   action: SnackBarAction(
  //       //     label: 'Desfazer',
  //       //     textColor: Colors.white,
  //       //     onPressed: () {
  //       //       setState(() {
  //       //         _allItems.insert(originalIndex, item);
  //       //       });
  //       //       _filterItems();
  //       //     },
  //       //   ),
  //       // ),
  //       );
  // }
  //
  // void _editItem(int index) {
  //   final item = _filteredItems[index];
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(
  //           'Editando ${ItemTypeHelper.label(item.type).toLowerCase()} ${item.name}'),
  //       backgroundColor: Color(0xFF1F2937),
  //       behavior: SnackBarBehavior.floating,
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  //     ),
  //   );
  // }
  //
  // void _viewItemDetails(int index) {
  //   final item = _filteredItems[index];
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text('Abrindo detalhes de ${item.name}'),
  //       backgroundColor: Color(0xFF1F2937),
  //       behavior: SnackBarBehavior.floating,
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  //     ),
  //   );
  // }

  // void _addNewItem() {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     backgroundColor: Colors.white,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
  //     ),
  //     builder: (context) {
  //       return Padding(
  //         padding: const EdgeInsets.all(20),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Text(
  //               'Adicionar Novo Item',
  //               style: TextStyle(
  //                 fontSize: 20,
  //                 fontWeight: FontWeight.w700,
  //                 color: Colors.black87,
  //               ),
  //             ),
  //             const SizedBox(height: 20),
  //             // Aqui viria o formulário de adição
  //             Text('Formulário de adição em desenvolvimento...'),
  //             const SizedBox(height: 20),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: UIAppBar(
        title: R.strings.myProducts,
        actions: const [ItemAddNewWidget()],
      ),
      body: FadeSlideTransitionAnimator(
        child: BlocConsumer<ListProductCubit, ListProductState>(
          listener: (context, state) {},
          builder: (context, state) => state.when(
            initial: () => const CircularProgressIndicator(),
            loading: () => const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
              ),
            ),
            error: (message) => Center(child: Text(message)),
            empty: () => const EmptyStateWidget(),
            success: (items) {
              return Column(
                children: [
                  const SizedBox(height: 20),
                  ItemFilterWidget(
                    selectedFilter: _selectedFilter,
                    onFilterChanged: _onFilterChanged,
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: RefreshIndicator(
                      backgroundColor: AppColors.primaryColor,
                      color: Colors.white,
                      onRefresh: () async {
                        context.read<ListProductCubit>().fetchItems();
                      },
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];
                          // var i = index;
                          if (index == (items.length - 1)) {
                            index = -1;
                          }
                          return AnimatedContainer(
                            duration:
                                Duration(milliseconds: 300 + (index * 100)),
                            curve: Curves.easeOut,
                            child: ItemCardWidget(
                              item: item,
                              index: index,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
