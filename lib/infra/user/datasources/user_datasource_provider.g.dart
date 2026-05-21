// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_datasource_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userDataSource)
final userDataSourceProvider = UserDataSourceProvider._();

final class UserDataSourceProvider
    extends $FunctionalProvider<UserDataSource, UserDataSource, UserDataSource>
    with $Provider<UserDataSource> {
  UserDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userDataSourceHash();

  @$internal
  @override
  $ProviderElement<UserDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserDataSource create(Ref ref) {
    return userDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserDataSource>(value),
    );
  }
}

String _$userDataSourceHash() => r'63acd83e73789313ee441895677f805b80ce2774';
