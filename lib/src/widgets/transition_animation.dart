import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage customPageTransition(
    BuildContext context, GoRouterState state, Widget screen) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: screen,
    barrierDismissible: true,
    barrierColor: Colors.black38,
    opaque: false,
    transitionDuration: const Duration(milliseconds: 500),
    reverseTransitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
