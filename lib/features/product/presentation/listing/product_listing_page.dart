import 'package:deehelp/core/components/custom_modal_bottom_sheet.dart';
import 'package:deehelp/core/components/dialogs/dialog_extension.dart';
import 'package:deehelp/core/components/loader/loading.dart';
import 'package:deehelp/core/components/ui_app_bar.dart';
import 'package:deehelp/shared/animation/fade_slide_transition_animator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/components/empty_state_widget.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/router/router_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../domain/entities/product.dart';
import '../update/update_product_page.dart';
import 'components/add_new_product_widget.dart';
import 'components/product_card_widget.dart';
import 'components/product_filter_widget.dart';
import 'components/product_modal_widget.dart';
import 'product_listing_cubit.dart';
import 'state/list_product_state.dart';

class ProductListingPage extends StatefulWidget {
  final bool showBackButton;

  const ProductListingPage({super.key, this.showBackButton = false});

  @override
  State<ProductListingPage> createState() => _ProductListingPageState();
}

class _ProductListingPageState extends State<ProductListingPage> {
  @override
  void initState() {
    context.read<ProductListingCubit>().fetchItems();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _add() {
    context.push(RouterConstant.createNewItem);
  }

  void _onDelete(Product item) async {
    context.pop();
    final cubit = context.read<ProductListingCubit>();
    final yes = await context.showQuestionDialog(
      "Apagar",
      "Deletar produto ${item.name}",
    );

    if (yes) {
      cubit.delete(item);
    }
  }

  void _onEdit(Product product) async {
    final cubit = context.read<ProductListingCubit>();
    final result = await UpdateProductPage.navigate(context, product);

    if (result != null) {
      final action = result['action'];
      final productUpdated = result['value'];
      final message = result['message'];

      if (mounted) {
        context.showSnackBar(message);
      }

      await cubit.refresh(productUpdated, action);
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
          AddNewProductWidget(
            press: () async {
              await context.push(RouterConstant.createNewItem);
            },
          )
        ],
      ),
      body: FadeSlideTransitionAnimator(
        child: BlocConsumer<ProductListingCubit, ListProductState>(
          listener: (context, state) {
            state.maybeWhen(
              deleteLoading: () => Loading.instance()
                  .show(context: context, text: R.strings.productDeleting),
              deleteSuccess: () {
                Loading.instance().hide();
                context.showSnackBar(R.strings.productDeletedSuccess);
              },
              error: (message) {
                Loading.instance().hide();
                context.showSnackBar(message, type: DialogType.error);
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
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
                      child: ProductFilterWidget(
                        selectedFilter: filter,
                        onFilterChanged: (value) {
                          context.read<ProductListingCubit>().filter(value);
                        },
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (items.isEmpty) EmptyStateWidget(press: () => _add()),
                    Expanded(
                      child: RefreshIndicator(
                        backgroundColor: AppColors.primaryColor,
                        color: Colors.white,
                        onRefresh: () async {
                          context.read<ProductListingCubit>().fetchItems();
                        },
                        child: ListView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            return AnimatedContainer(
                              duration:
                                  Duration(milliseconds: 300 + (index * 100)),
                              curve: Curves.easeOut,
                              child: ProductCardWidget(
                                item: item,
                                index: index,
                                press: () => _onEdit(item),
                                onMenuPress: () {
                                  customModalBottomSheet(
                                    context,
                                    child: ProductModalWidget(
                                      item: item,
                                      onDelete: () => _onDelete(item),
                                      onEdit: () {
                                        context.pop();
                                        _onEdit(item);
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
              orElse: () => EmptyStateWidget(press: () => _add()),
            );
          },
        ),
      ),
    );
  }
}
