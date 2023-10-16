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
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.green.shade700,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: () {
                        context.push(Routes.login.path);
                      },
                      child: const Text(
                          style: TextStyle(color: Colors.white),
                          'Get Started'))),
            )
          ],
        ),
      ),
    ));
  }
}
