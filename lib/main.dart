import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_code/app.dart';
import 'package:sp_util/sp_util.dart';
import 'package:user_repository/user_repository.dart';

void mainCom() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  runApp(
    MaterialApp(
      home: App(
        authenticationRepository: AuthenticationRepository(),
        userRepository: UserRepository(),
      ),
    ),
  );
}
