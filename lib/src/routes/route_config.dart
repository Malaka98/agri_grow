import 'package:agry_go/src/screens/dashboard/dashboard.dart';
import 'package:agry_go/src/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../screens/app_root/app_root.dart';
import '../widgets/transition_animation.dart';

enum Routes {
  initial('app_root', '/'),
  login('login', '/login'),
  dashboard('dashboard', '/dashboard');

  const Routes(this.name, this.path);

  final String name;
  final String path;

  @override
  String toString() => name;
}

final GoRouter routerConfig =
    GoRouter(initialLocation: Routes.initial.path, routes: <RouteBase>[
  GoRoute(
      name: Routes.initial.name,
      path: Routes.initial.path,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return customPageTransition(context, state, const AppRoot());
      }),
  GoRoute(
      name: Routes.login.name,
      path: Routes.login.path,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return customPageTransition(context, state, const Login());
      }),
  GoRoute(
      name: Routes.dashboard.name,
      path: Routes.dashboard.path,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return customPageTransition(context, state, const Dashboard());
      }),
]);
