enum ItemStatus {
  active("active"),
  inactive("inactive"),
  pending("pending");

  const ItemStatus(this.value);
  final String value;

  @override
  String toString() => value;
}
