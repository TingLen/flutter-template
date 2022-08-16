import 'dart:async';

import 'package:meta_user_api/meta_user_api.dart';
import 'package:user_repository/src/models/models.dart';

class UserRepository {
  UserDetail? _userDetail;

  final MetaUserApiClient _userApiClient = MetaUserApiClient();

  Future<UserDetail?> getUser() async {
    var user = await _userApiClient.getUserDetail();
    _userDetail = user;
    return user;
  }
}
