import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code/authentication/authentication.dart';

class HomeDetail extends StatelessWidget {
  static String path = '/home_detail';

  const HomeDetail({Key? key}) : super(key: key);

  static Handler handler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const HomeDetail();
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Logout'),
          onPressed: () {
            context
                .read<AuthenticationBloc>()
                .add(AuthenticationLogoutRequested());
          },
        ),
      ),
    );
  }
}
