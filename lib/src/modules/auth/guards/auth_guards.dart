import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/src/');

  @override
  //HERE IT WILL FIND FOR THE LAST USER IF IT IS STILL AUTHENTICATED
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    return true;
  }
}
