import 'package:dio/dio.dart';
import 'package:flutter_code/http/http.dart';
import 'package:flutter_code/main.dart';
import 'package:net/net.dart';
import 'env/env.dart';

void initDio() {
  final List<Interceptor> interceptors = <Interceptor>[];

  /// 统一添加身份验证请求头
  interceptors.add(AuthInterceptor());
  configDio(
    baseUrl: 'https://api.github.com/',
    interceptors: interceptors,
  );
}

void initEnv() {
  const String baseUrl = '/prod-api';
  Env.env = EnvEnum.development;
  Env.baseUrl = baseUrl;
}

void main() {
  initEnv();
  initDio();
  mainCom();
}
