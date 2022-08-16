import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code/home/home.dart';
import 'package:flutter_code/home_detail/view/home_detail.dart';
import 'package:flutter_code/login/login.dart';
import 'package:flutter_code/not_found/view/not_found.dart';
import 'package:flutter_code/splash/splash.dart';

class AppRoutes {
  static final FluroRouter router = FluroRouter();

  static configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
        return const NotFound();
      },
    );

    router.define(HomePage.path, handler: HomePage.handler);
    router.define(LoginPage.path, handler: LoginPage.handler);
    router.define(HomeDetail.path, handler: HomeDetail.handler);
    router.define(SplashPage.path, handler: SplashPage.handler);
  }
}
