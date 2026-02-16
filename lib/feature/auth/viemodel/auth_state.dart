import 'package:deehelp/module/auth/domain/entity/authenticated_user.dart';
import 'package:deehelp/module/auth/domain/services/operation_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthStateInitial;
  const factory AuthState.loading() = AuthStateLoading;
  const factory AuthState.loadingAuthWithoutAccount() =
      AuthStateLoadingAuthWithoutAccount;
  const factory AuthState.authenticated(AuthenticatedUser user) =
      AuthStateAuthenticated;
  const factory AuthState.unauthenticated() = AuthStateUnAuthenticated;
  const factory AuthState.error(String error, OperationStatus status) =
      AuthStateError;
}
