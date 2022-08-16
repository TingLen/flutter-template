import 'dart:async';

import 'package:meta_authentication_api/meta_authentication_api.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final MetaAuthenticationApiClient _metaAuthenticationApiClient =
      MetaAuthenticationApiClient();
  final _controller = StreamController<AuthenticationStatus>();

  Stream<AuthenticationStatus> get status async* {
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String username,
    required String password,
    required Future Function(String? token) onSuccess,
  }) async {
    await _metaAuthenticationApiClient.login(
      username: username,
      password: password,
      onSuccess: ((token) async {
        await onSuccess(token);
        _controller.add(AuthenticationStatus.authenticated);
      }),
    );
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
