import 'package:deehelp/feature/items/list/item_listing_args.dart';

class ItemListRouteArgs {
  final ItemListingArgs? args;
  final bool showBackButton;

  const ItemListRouteArgs({
    this.args,
    this.showBackButton = false,
  });
}
