import 'package:deehelp/business/user/usecases/get_profile/user_delete_request.dart';
import 'package:deehelp/business/user/usecases/get_profile/user_archivement.dart';

class UserProfile {
  final String id;
  final String name;
  final String nickname;
  final String email;
  final String? phone;
  final String? urlPhoto;
  final String? bio;
  final bool isVerified;
  final bool isAdmin;
  final String? status;
  final int totalAlerts;
  final int totalViews;
  final int totalComments;
  final List<UserArchivement>? archivements;
  final UserDeleteRequest? deleteRequest;

  UserProfile(
      {required this.id,
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
      required this.deleteRequest});
}
