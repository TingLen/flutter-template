import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_code/router/app_routes.dart';
import 'package:flutter_code/router/router.dart';
import 'package:flutter_code/splash/view/splash.dart';
import 'package:flutter_code/theme/theme.dart';
import 'package:user_repository/user_repository.dart';
import 'authentication/authentication.dart';
import 'home/home.dart';
import 'login/login.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.authenticationRepository,
    required this.userRepository,
  });

  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationRepository>(
            create: (context) => authenticationRepository)
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthenticationBloc(
              authenticationRepository: authenticationRepository,
              userRepository: userRepository,
            )..add(AuthenticationChecked()),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  NavigatorState get _navigator => navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    AppRoutes.configureRoutes(AppRoutes.router);
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: customTheme,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                AppRoutes.router.navigateTo(
                  _navigator.context,
                  HomePage.path,
                  clearStack: true,
                );
                break;
              case AuthenticationStatus.unauthenticated:
                AppRoutes.router.navigateTo(
                  _navigator.context,
                  LoginPage.path,
                  clearStack: true,
                );
                break;
              case AuthenticationStatus.unknown:
                AppRoutes.router.navigateTo(
                  _navigator.context,
                  SplashPage.path,
                  clearStack: true,
                );
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: AppRoutes.router.generator,
    );
  }
}
