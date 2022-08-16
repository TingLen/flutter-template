import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static const String path = '/splash';

  static Handler handler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const SplashPage();
    },
  );

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
