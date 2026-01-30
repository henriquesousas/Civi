import 'package:deehelp/core/ui/router/app_router.dart';
import 'package:deehelp/core/ui/theme/app_colors.dart';
import 'package:deehelp/core/ui/widgets/button/ui_elevated_icon_button.dart';
import 'package:deehelp/core/ui/widgets/empty/empty_state_widget.dart';
import 'package:deehelp/core/ui/widgets/shimmer_animation.dart';
import 'package:deehelp/features/auth/external/di/authenticated_user_provider.dart';
import 'package:deehelp/features/products/domain/entities/product.dart';
import 'package:deehelp/features/products/presentation/views/listing/widgets/product_list_card_tile.dart';
import 'package:deehelp/core/base/base_page.dart';
import 'package:deehelp/features/products/presentation/views/listing/product_listing_shimmer.dart';
import 'package:deehelp/features/products/presentation/providers/product_viewmodel_provider.dart';
import 'package:deehelp/features/products/presentation/views/listing/state/list_product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProductListingPage extends BasePage {
  static final isAddIncidentKey = "isAddIncidentKey";
  final bool showBackButton;
  final bool isAddIncident;
  const ProductListingPage({
    super.key,
    this.showBackButton = false,
    this.isAddIncident = true,
  });

  @override
  ConsumerState<ProductListingPage> createState() => _ProductListingPageState();
}

class _ProductListingPageState extends BasePageState<ProductListingPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userId = ref.watch(authenticatedUserProvider)?.id;
      if (userId != null) {
        ref.read(productListingViewmodelProvider.notifier).getProducts(userId);
      }
    });
  }

  @override
  String? pageTitle() => "Lista de bens";

  @override
  VoidCallback? onBackPress() {
    return () {
      context.pop();
    };
  }

  @override
  Widget? buildBottomNavigationBar() {
    return ref.watch(productListingViewmodelProvider).maybeWhen(
          success: (items, selectedFilter) => SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: UIElevatedIconButton(
                icon: const Icon(
                  Icons.add,
                  color: AppColors.whiteColor,
                ),
                text: "Adicionar novo",
                press: () => _add(),
              ),
            ),
          ),
          orElse: () => null,
        );
  }

  void _add() => context.push(AppRouter.addProduct);

  void _onEdit(Product product) async {
    await context.push<Map<String, dynamic>?>(
      AppRouter.editProduct,
      extra: product,
    );
  }

  @override
  Widget buildPage(BuildContext context) {
    final state = ref.watch(productListingViewmodelProvider);

    return state.maybeMap(
      success: (value) => _buildView(value.items),
      loading: (_) => ShimmerAnimation(
        enabled: true,
        child: _buildView(productListShimmer),
      ),
      orElse: () =>
          EmptyStateWidget(press: () => context.push(AppRouter.addProduct)),
    );
  }

  Widget _buildView(List<Product> items) {
    return Column(
      spacing: 5,
      children: [
        Text(
          "Por questões de segurança, todo item cadastrado (como celulares, veículos, eletrônicos, etc.) passa por uma validação interna antes de ser liberado no aplicativo.",
          textAlign: TextAlign.center,
          style: TextStyle(
            // color: AppColors.textSecondary,
            color: Theme.of(context).colorScheme.surfaceDim,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  itemCount: items.length,
                  itemBuilder: (ctx, index) {
                    final product = items[index];
                    return ProductListTileCard(
                      product: product,
                      onPressed: () {
                        if (widget.isAddIncident) {
                          context.pop(product);
                          return;
                        }

                        _onEdit(product);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
