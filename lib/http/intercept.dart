import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_code/common/constant.dart';
import 'package:flutter_code/router/router.dart';
import 'package:net/net.dart';
import 'package:sp_util/sp_util.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String accessToken = SpUtil.getString(Constant.accessToken)!;
    if (accessToken.isNotEmpty) {
      options.headers['Authorization'] = accessToken;
    }
    super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    var data = json.decode(response.data) as Map<String, dynamic>;
    var code = data['code'] ?? 0;
    if (response.statusCode == ExceptionHandle.unauthorized ||
        ExceptionHandle.unauthorized == code) {
      BlocProvider.of<AuthenticationBloc>(
        navigatorKey.currentState!.overlay!.context,
      ).add(
        AuthenticationLogoutRequested(),
      );
      DioError err = DioError(requestOptions: response.requestOptions);
      throw err;
    }
    super.onResponse(response, handler);
  }
}
