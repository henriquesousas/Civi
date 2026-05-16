import 'package:deehelp/business/_shared/failures/exports.dart';
import 'package:deehelp/business/auth/domain/loggued_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthStateInitial;
  const factory AuthState.loading() = AuthStateLoading;
  const factory AuthState.authenticated(LogguedUser user) =
      AuthStateAuthenticated;
  const factory AuthState.error(String error, TypeFailure type) =
      AuthStateError;
  //TODO: Remover
  const factory AuthState.unauthenticated() = AuthStateUnAuthenticated;
  const factory AuthState.loadingAuthWithoutAccount() =
      AuthStateLoadingAuthWithoutAccount;
}
