// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_with_google_usecase_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(signInWithGoogleUseCase)
final signInWithGoogleUseCaseProvider = SignInWithGoogleUseCaseProvider._();

final class SignInWithGoogleUseCaseProvider extends $FunctionalProvider<
    SignInWithGoogleUseCase,
    SignInWithGoogleUseCase,
    SignInWithGoogleUseCase> with $Provider<SignInWithGoogleUseCase> {
  SignInWithGoogleUseCaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'signInWithGoogleUseCaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$signInWithGoogleUseCaseHash();

  @$internal
  @override
  $ProviderElement<SignInWithGoogleUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SignInWithGoogleUseCase create(Ref ref) {
    return signInWithGoogleUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SignInWithGoogleUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SignInWithGoogleUseCase>(value),
    );
  }
}

String _$signInWithGoogleUseCaseHash() =>
    r'026f494e7131b611887c663cad0bf2431bf76257';
