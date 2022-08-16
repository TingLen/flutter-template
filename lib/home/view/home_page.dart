import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code/authentication/bloc/authentication_bloc.dart';
import 'package:flutter_code/env/env.dart';
import 'package:flutter_code/home_detail/view/home_detail.dart';
import 'package:flutter_code/router/app_routes.dart';

class HomePage extends StatelessWidget {
  static String path = '/home';

  static Handler handler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return const HomePage();
    },
  );

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Builder(
              builder: (context) {
                final userId = context.select(
                  (AuthenticationBloc bloc) => bloc.state.user?.userId ?? '-',
                );
                return Column(
                  children: [
                    Text('UserID: $userId'),
                    Text('env: ${Env.env}'),
                    CupertinoButton(
                      child: const Text('not found page'),
                      onPressed: () =>
                          {AppRoutes.router.navigateTo(context, '/12312')},
                    ),
                    CupertinoButton(
                      child: const Text('detail'),
                      onPressed: () => {
                        AppRoutes.router.navigateTo(
                          context,
                          HomeDetail.path,
                        )
                      },
                    )
                  ],
                );
              },
            ),
            ElevatedButton(
              child: const Text('Logout'),
              onPressed: () {
                context
                    .read<AuthenticationBloc>()
                    .add(AuthenticationLogoutRequested());
              },
            ),
          ],
        ),
      ),
    );
  }
}
