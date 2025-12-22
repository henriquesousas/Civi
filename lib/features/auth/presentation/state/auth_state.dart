import 'package:deehelp/features/auth/domain/services/operation_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthStateInitial;
  const factory AuthState.loading() = AuthStateLoading;
  const factory AuthState.authenticated(String userName) =
      AuthStateAuthenticated;
  const factory AuthState.error(String error, OperationStatus status) =
      AuthStateError;
}
