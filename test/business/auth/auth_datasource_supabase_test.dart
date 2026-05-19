import 'package:deehelp/infra/failures/exports.dart';
import 'package:deehelp/infra/failures/network_failure.dart';
import 'package:deehelp/infra/failures/invalid_credentials_failure.dart';
import 'package:deehelp/business/auth/loggued_user.dart';
import 'package:deehelp/infra/auth/auth_datasource_supabase.dart';
import 'package:deehelp/old_core/services/network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MockSupabaseClient extends Mock implements SupabaseClient {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockSupabaseAuth extends Mock implements GoTrueClient {}

void main() {
  late MockSupabaseClient mockClient;
  late MockNetworkInfo mockNetworkInfo;
  late MockSupabaseAuth mockAuth;
  late AuthDataSourceSupabase sut;

  setUp(() {
    mockClient = MockSupabaseClient();
    mockNetworkInfo = MockNetworkInfo();
    mockAuth = MockSupabaseAuth();

    when(() => mockClient.auth).thenReturn(mockAuth);

    sut = AuthDataSourceSupabase(
      client: mockClient,
      networkInfo: mockNetworkInfo,
    );
  });

  test('givenAuthDataSource_whenNoConnection_thenThrowsNetworkFailure',
      () async {
    when(() => mockNetworkInfo.hasConnection).thenAnswer((_) async => false);

    expect(
      () => sut.signInWithGoogle('any_token', 'any_access_token'),
      throwsA(isA<NetworkFailure>()),
    );
  });

  test('givenAuthDataSource_whenSignInSucceeds_thenReturnsLoggedUser',
      () async {
    final expectedLogguedUser =
        LogguedUser(id: "any_id", name: "any_name", email: "any_email");

    final expectedUserSupabase = User(
      id: 'any_id',
      email: 'any_email',
      appMetadata: {},
      userMetadata: {'full_name': 'any_name', 'email': 'any_email'},
      aud: 'authenticated',
      createdAt: DateTime.now().toIso8601String(),
    );

    final expectedAuthResponse = AuthResponse(
      session: null,
      user: expectedUserSupabase,
    );

    when(() => mockNetworkInfo.hasConnection).thenAnswer((_) async => true);

    when(() => mockAuth.signInWithIdToken(
          provider: OAuthProvider.google,
          idToken: any(named: 'idToken'),
          accessToken: any(named: 'accessToken'),
        )).thenAnswer((_) async => expectedAuthResponse);

    final res = await sut.signInWithGoogle('any', 'any');

    expect(res, expectedLogguedUser);
  });

  test('user null', () async {
    final expectedAuthResponse = AuthResponse(
      session: null,
      user: null,
    );

    when(() => mockNetworkInfo.hasConnection).thenAnswer((_) async => true);

    when(() => mockAuth.signInWithIdToken(
          provider: OAuthProvider.google,
          idToken: any(named: 'idToken'),
          accessToken: any(named: 'accessToken'),
        )).thenAnswer((_) async => expectedAuthResponse);

    expect(
      () => sut.signInWithGoogle('any_token', 'any_access_token'),
      throwsA(isA<InvalidCredentialsFailure>()),
    );
  });
}
