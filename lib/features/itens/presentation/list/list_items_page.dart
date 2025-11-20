import 'package:deehelp/core/components/custom_modal_bottom_sheet.dart';
import 'package:deehelp/core/components/dialogs/dialog_extension.dart';
import 'package:deehelp/core/components/loader/loading.dart';
import 'package:deehelp/core/components/ui_app_bar.dart';
import 'package:deehelp/features/itens/domain/entities/my_items.dart';
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
  final bool showBackButton;
  const ListItemPage({super.key, this.showBackButton = false});

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
  void dispose() {
    super.dispose();
  }

  void _navigateCreateNewProduct() {
    context.push(RouterConstant.createNewItem);
  }

  void _onDelete(Item item) async {
    final cubit = context.read<ListProductCubit>();
    final yes = await context.showQuestionDialog(
        "Apagar", "Deletar produto ${item.name}");

    if (yes) {
      cubit.delete(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: UIAppBar(
        title: R.strings.myProducts,
        leading: widget.showBackButton
            ? IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back))
            : null,
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
            listener: (context, state) {
          state.maybeWhen(
            deleteLoading: () => Loading.instance()
                .show(context: context, text: R.strings.productDeleting),
            deleteSuccess: () {
              context.showSnackBar(R.strings.productDeletedSuccess);
              Loading.instance().hide();
            },
            error: (message) {
              context.showSnackBar(message, type: DialogType.error);
              Loading.instance().hide();
            },
            orElse: () {},
          );
        }, builder: (context, state) {
          return state.maybeWhen(
            loading: () {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
                ),
              );
            },
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
                  if (items.isEmpty)
                    EmptyStateWidget(press: () => _navigateCreateNewProduct()),
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
                              press: () => context.push(RouterConstant.itemEdit,
                                  extra: item),
                              onMenuPress: () {
                                customModalBottomSheet(
                                  context,
                                  child: ItemModalWidget(
                                    item: item,
                                    onDelete: () {
                                      context.pop();
                                      _onDelete(item);
                                    },
                                    onEdit: () {
                                      context.pop();
                                      context.push(
                                        RouterConstant.itemEdit,
                                        extra: item,
                                      );
                                    },
                                    onClose: () => context.pop(),
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
            orElse: () =>
                EmptyStateWidget(press: () => _navigateCreateNewProduct()),
          );
        }),
      ),
    );
  }
}
