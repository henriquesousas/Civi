import 'package:deehelp/business/auth/loggued_user.dart';
import 'package:deehelp/module/auth/external/di/auth_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//TODO verificar se precisa
final logguedUserProviderOld = Provider<LogguedUser?>((ref) {
  final session = ref.watch(authStateProvider).maybeWhen(
        data: (session) => session,
        orElse: () => null,
      );

  final user = session?.user;
  if (user == null) return null;

  // final metadata = user.userMetadata ?? {};

  // return LoggedUser.create(metadata);
  return null;

  // return LoggedUser(
  //   id: user.id,
  //   email: user.email ?? '',
  //   name: metadata['name'] as String? ?? '',
  //   photoUrl: metadata['avatar_url'] as String?,
  // );
});
