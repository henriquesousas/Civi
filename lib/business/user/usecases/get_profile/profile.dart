import 'package:deehelp/business/user/usecases/get_profile/account_deletion_request.dart';
import 'package:deehelp/business/user/usecases/get_profile/archivement.dart';

class Profile {
  final String id;
  final String name;
  final String nickname;
  final String email;
  final String? phone;
  final String? urlPhoto;
  final String? bio;
  final bool isVerified;
  final bool isAdmin;
  final String status;
  final int totalAlerts;
  final int totalViews;
  final int totalComments;
  final List<Archivement>? archivements;
  final AccountDeletionRequest? accountDeletionRequest;

  Profile({
    required this.id,
    required this.name,
    required this.nickname,
    required this.email,
    required this.phone,
    required this.urlPhoto,
    required this.bio,
    required this.isVerified,
    required this.isAdmin,
    required this.status,
    required this.totalAlerts,
    required this.totalViews,
    required this.totalComments,
    required this.archivements,
    required this.accountDeletionRequest,
  });
}
