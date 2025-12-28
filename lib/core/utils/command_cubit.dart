// import 'package:deehelp/core/domain/exception/app_exception.dart';
// import 'package:deehelp/features/auth/presentation/auth/state/auth_state.dart';

// import '../domain/type/result.dart';

// class CommandCubit {
//   ///
//   /// Use [T] as Result of service/usecase.
//   ///
//   /// Use [State] as State of bloc
//   ///
//   /// UseCase must return a [T].
//   static Future<void> execute<T extends Object, State>({
//     required void Function(State) emit,
//     required Future<EitherResult<T>> Function() command,
//     State Function()? onLoading,
//     required State Function(T result) onSuccess,
//     required State Function(AppException error) onError,
//   }) async {
//     try {
//       if (onLoading != null) {
//         emit(onLoading());
//       }
//       final result = await command();
//       result.fold(
//         (error) => emit(onError(error)),
//         (success) => emit(onSuccess(success)),
//       );
//     } catch (e) {
//       emit(onError(AppException(
//           message:
//               "Não foi possível realizar operação, tente novamente mais tarde...")));
//     }
//   }
// }

// class UseCaseCommand {
//   static void execute({
//     required AuthState state,
//     required Function() onLoading,
//     required Function() onError,
//   }) {
//     try {
//       state = onLoading();
//       state = onLoading();
//       // final result = await _loginWithGoogleUsecase.execute();
//       // result.when(
//       //   success: (session) => state = const AuthState.authenticated(),
//       //   failure: (error) => onError(),
//       // );
//     } catch (e) {
//       state = onError();
//     }
//   }
// }
