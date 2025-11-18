import 'package:deehelp/core/components/custom_modal_bottom_sheet.dart';
import 'package:deehelp/core/components/ui_app_bar.dart';
import 'package:deehelp/features/itens/presentation/list/bloc/list_product_state.dart';
import 'package:deehelp/features/itens/presentation/list/components/item_add_new_widget.dart';
import 'package:deehelp/features/itens/presentation/list/components/item_modal_widget.dart';
import 'package:deehelp/shared/animation/fade_slide_transition_animator.dart';
import 'package:deehelp/shared/extensions/screen_size_extension.dart';
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
                                  height: context.percentHeight(0.3),
                                  child: ItemModalWidget(
                                    item: item,
                                    onDelete: () => context
                                        .read<ListProductCubit>()
                                        .delete(),
                                    onEdit: () {},
                                  ),
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
