import 'package:deehelp/core/components/custom_modal_bottom_sheet.dart';
import 'package:deehelp/core/components/ui_app_bar.dart';
import 'package:deehelp/features/itens/presentation/list/bloc/list_product_state.dart';
import 'package:deehelp/features/itens/presentation/list/components/item_add_new_widget.dart';
import 'package:deehelp/features/itens/presentation/list/components/item_modal_widget.dart';
import 'package:deehelp/shared/animation/fade_slide_transition_animator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/components/empty_state_widget.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/router/router_constants.dart';
import '../../../../core/theme/app_colors.dart';
import 'bloc/list_product_cubit.dart';
import 'components/item_card_widget.dart';
import 'components/item_filter_widget.dart';

class ListItemPage extends StatefulWidget {
  const ListItemPage({super.key});

  @override
  State<ListItemPage> createState() => _ListItemPageState();
}

class _ListItemPageState extends State<ListItemPage> {
  @override
  void initState() {
    context.read<ListProductCubit>().fetchItems();
    super.initState();
  }
  //
  // void _showOptions(BuildContext context, Item item) {
  //   customModalBottomSheet(
  //     context,
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           // Handle do bottom sheet
  //           Container(
  //             width: 40,
  //             height: 4,
  //             decoration: BoxDecoration(
  //               color: Colors.grey[300],
  //               borderRadius: BorderRadius.circular(2),
  //             ),
  //           ),
  //           const SizedBox(height: 20),
  //           Text(
  //             item.name,
  //             style: Theme.of(context).textTheme.titleMedium?.copyWith(
  //                   fontWeight: FontWeight.w600,
  //                 ),
  //           ),
  //           const SizedBox(height: 16),
  //           const Divider(height: 1, color: Color(0xFFF3F4F6)),
  //           // Opções
  //           _buildOptionItem(
  //             context: context,
  //             icon: Icons.edit_outlined,
  //             title: 'Editar',
  //             color: Color(0xFF6B7280),
  //             onTap: () {},
  //           ),
  //           _buildOptionItem(
  //             context: context,
  //             icon: Icons.delete_outline,
  //             title: 'Excluir',
  //             color: Color(0xFFEF4444),
  //             onTap: () {},
  //           ),
  //           const SizedBox(height: 16),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget _buildOptionItem({
  //   required BuildContext context,
  //   required IconData icon,
  //   required String title,
  //   required Color color,
  //   required VoidCallback onTap,
  // }) {
  //   return ListTile(
  //     leading: Container(
  //       width: 36,
  //       height: 36,
  //       decoration: BoxDecoration(
  //         color: color.withValues(alpha: 0.1),
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       child: Icon(icon, color: color, size: 20),
  //     ),
  //     title: Text(
  //       title,
  //       style: Theme.of(context)
  //           .textTheme
  //           .titleSmall
  //           ?.copyWith(fontWeight: FontWeight.normal),
  //     ),
  //     trailing: Icon(Icons.chevron_right, color: Colors.grey[400], size: 20),
  //     contentPadding: const EdgeInsets.symmetric(vertical: 4),
  //     onTap: () {
  //       Navigator.pop(context);
  //       onTap();
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: UIAppBar(
        title: R.strings.myProducts,
        actions: [
          ItemAddNewWidget(
            press: () async {
              await context.push(RouterConstant.createNewItem);
            },
          )
        ],
      ),
      body: FadeSlideTransitionAnimator(
        child: BlocConsumer<ListProductCubit, ListProductState>(
          listener: (context, state) {},
          builder: (context, state) => state.maybeWhen(
            loading: () => const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
              ),
            ),
            error: (message) => Center(child: Text(message)),
            success: (items, filter) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ItemFilterWidget(
                      selectedFilter: filter,
                      onFilterChanged: (value) {
                        context.read<ListProductCubit>().filter(value);
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (items.isEmpty) const EmptyStateWidget(),
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
                              onMenuPress: () {
                                customModalBottomSheet(
                                  context,
                                  child: ItemModalWidget(item: item),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
            orElse: () => const EmptyStateWidget(),
          ),
        ),
      ),
    );
  }
}
