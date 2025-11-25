import 'package:equatable/equatable.dart';

class DeleteProductDto extends Equatable {
  final String itemId;
  final String userId;
  final String imageUrl;

  const DeleteProductDto({
    required this.itemId,
    required this.userId,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [itemId, userId, imageUrl];
}
