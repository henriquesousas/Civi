import 'package:deehelp/core/components/dialogs/dialog_extension.dart';
import 'package:deehelp/features/base_page.dart';
import 'package:deehelp/features/base_page_state.dart';
import 'package:deehelp/features/product/presentation/listing/listing_my_products_shimmer.dart';
import 'package:deehelp/features/product/presentation/listing/status_info_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/empty_state_widget.dart';
import '../../../../core/components/loader/loading.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/router/router_constants.dart';
import '../../../../core/widgets/card/ui_custom_app_card.dart';
import '../../domain/entities/product.dart';
import '../update/update_product_page.dart';
import 'listing_my_products_cubit.dart';
import 'my_products_list_tile_card.dart';
import 'state/list_product_state.dart';

class ListingMyProductsPage
    extends BasePage<ProductListingCubit, ListProductState> {
  final bool showBackButton;

  const ListingMyProductsPage({super.key, required this.showBackButton});

  @override
  State<StatefulWidget> createState() => _ProductListingPage();
}

class _ProductListingPage extends BasePageState<ProductListingCubit,
    ListProductState, ListingMyProductsPage> {
  @override
  void initState() {
    cubit.fetchItems();
    super.initState();
  }

  void _add() => navigate(RouterConstant.createNewItem);

  void _onEdit(Product product) async {
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
  String? pageTitle() => R.strings.myProducts;

  @override
  void listener(BuildContext context, ListProductState state) {
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
  }

  @override
  Widget buildPage(BuildContext context, ListProductState state) {
    return state.maybeWhen(
      success: (products, filter) {
        return Column(
          children: [
            Expanded(
              child: UICustomAppCard(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: ListView.builder(
                        physics: const ClampingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics(),
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return MyProductsListTileCard(
                            product: product,
                            onPressed: () => _onEdit(product),
                          );
                        },
                      ),
                    ),
                    StatusInfoText(onLearnMoreTap: () {}),
                  ],
                ),
              ),
            ),
          ],
        );
      },
      loading: () => const ListingMyProductsShimmer(),
      error: (message) => Center(child: Text(message)),
      orElse: () => EmptyStateWidget(press: () => _add()),
    );
  }
}
