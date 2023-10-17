import 'package:agry_go/src/screens/dashboard/dashboard.dart';
import 'package:agry_go/src/screens/deficiencies/deficiencies.dart';
import 'package:agry_go/src/screens/deficiencies_view/deficiencies_view.dart';
import 'package:agry_go/src/screens/disease_view/disease_view.dart';
import 'package:agry_go/src/screens/diseases/diseases.dart';
import 'package:agry_go/src/screens/login/login.dart';
import 'package:agry_go/src/screens/pests/pests.dart';
import 'package:agry_go/src/screens/pests_view/pests_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../screens/app_root/app_root.dart';
import '../widgets/transition_animation.dart';

enum Routes {
  initial('app_root', '/'),
  login('login', '/login'),
  dashboard('dashboard', '/dashboard'),
  diseases('diseases', '/diseases'),
  diseasesView('diseases_view', '/diseases_view'),
  pests('pests', '/pests'),
  pestsView('pests_view', '/pests_view'),
  deficiencies('deficiencies', '/deficiencies'),
  deficienciesView('deficiencies_view', '/deficiencies_view');

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
  GoRoute(
      name: Routes.diseases.name,
      path: Routes.diseases.path,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return customPageTransition(context, state, const Diseases());
      }),
  GoRoute(
      name: Routes.diseasesView.name,
      path: Routes.diseasesView.path,
      pageBuilder: (BuildContext context, GoRouterState state) {
        XFile image = state.extra as XFile;
        return customPageTransition(
            context,
            state,
            DiseaseView(
              image: image,
            ));
      }),
  GoRoute(
      name: Routes.pests.name,
      path: Routes.pests.path,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return customPageTransition(context, state, const Pests());
      }),
  GoRoute(
      name: Routes.pestsView.name,
      path: Routes.pestsView.path,
      pageBuilder: (BuildContext context, GoRouterState state) {
        XFile image = state.extra as XFile;
        return customPageTransition(
            context,
            state,
            PestsView(
              image: image,
            ));
      }),
  GoRoute(
      name: Routes.deficiencies.name,
      path: Routes.deficiencies.path,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return customPageTransition(context, state, const Deficiencies());
      }),
  GoRoute(
      name: Routes.deficienciesView.name,
      path: Routes.deficienciesView.path,
      pageBuilder: (BuildContext context, GoRouterState state) {
        XFile image = state.extra as XFile;
        return customPageTransition(
            context,
            state,
            DeficienciesView(
              image: image,
            ));
      }),
]);
