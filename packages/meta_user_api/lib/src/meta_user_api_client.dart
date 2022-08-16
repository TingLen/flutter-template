import 'package:meta_user_api/meta_user_api.dart';
import 'package:net/net.dart';

class MetaUserApiClient {
  Future<UserDetail?> getUserDetail() async {
    UserDetail? userDetail;
    await DioClient.instance.requestNetwork<UserDetail>(
      Method.get,
      '/framework/user/getMineInfo',
      onSuccess: (data) {
        userDetail = data;
      },
    );
    return userDetail;
  }
}
