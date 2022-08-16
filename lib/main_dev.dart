import 'package:dio/dio.dart';
import 'package:flutter_code/env/env.dart';
import 'package:flutter_code/http/http.dart';
import 'package:flutter_code/main.dart';
import 'package:net/net.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

void initDio() {
  final List<Interceptor> interceptors = <Interceptor>[];

  /// 统一添加身份验证请求头
  interceptors.add(AuthInterceptor());

  // logger
  interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    compact: false,
  ));
  configDio(
    baseUrl: 'http://localhost:8180',
    interceptors: interceptors,
  );
}

void initEnv() {
  const String baseUrl = 'http://localhost:8180';
  Env.env = EnvEnum.development;
  Env.baseUrl = baseUrl;
}

void main() async {
  initEnv();
  initDio();
  mainCom();
}
