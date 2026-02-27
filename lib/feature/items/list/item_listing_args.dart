class ItemListingArgs {
  final bool isAddingIncident;
  final bool fetchData;

  ItemListingArgs({
    required this.isAddingIncident,
    this.fetchData = false,
  });
}
