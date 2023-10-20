import 'package:agry_go/src/routes/route_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: InkWell(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/app_root.png"), fit: BoxFit.fill)),
        ),
        onTap: () {
          context.push(Routes.login.path);
        },
      )),
    );
  }
}
