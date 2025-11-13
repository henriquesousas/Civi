//TODO: refactor
class MyItems {
  final String name;
  final String code;
  final int year;
  final String? imageUrl;
  final bool active;
  final DateTime createdAt;
  final bool isVehicle;

  MyItems(
    this.name,
    this.code,
    this.isVehicle,
    this.year,
    this.imageUrl,
    this.active, {
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();
}
