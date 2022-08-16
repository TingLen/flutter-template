import 'package:net/net.dart';

class MetaAuthenticationApiClient {
  Future<void> login(
      {required String username,
      required String password,
      required Function(String? token) onSuccess}) async {
    var data = {'username': username, 'password': password};
    DioClient.instance.requestNetwork<String>(
      Method.post,
      '/framework/login',
      data: data,
      onSuccess: onSuccess,
    );
  }
}
