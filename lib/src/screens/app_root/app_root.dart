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
          body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomLeft,
                colors: [
              Colors.green.shade100,
              Colors.green.shade50,
              Colors.white70,
              Colors.white
            ])),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 70.0, top: 70.0),
              height: 450,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage("assets/app_root.png"),
                      fit: BoxFit.fitWidth,
                      opacity: 0.8),
                  border: Border.all(width: 0, color: Colors.green.shade900),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0)),
                  color: Colors.green.shade900),
            ),
            Container(
              width: double.infinity,
              height: 70,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage("assets/app_root2.png"),
                    fit: BoxFit.cover,
                    opacity: 0.8),
                color: Colors.green.shade900,
                border: Border.all(width: 0, color: Colors.transparent),
              ),
              child: FittedBox(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  child: Container(
                    width: 250,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0, color: Colors.white),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0)),
                        color: Colors.white),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Get Started",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.green.shade800,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.arrow_forward_rounded,
                              size: 32,
                              color: Colors.green.shade800,
                            )
                          ],
                        )),
                  ),
                  onTap: () {
                    context.push(Routes.login.path);
                  },
                ),
              ),
            ),
            Flexible(
                child: Container(
              margin: const EdgeInsets.only(left: 150.0),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                    image: AssetImage("assets/app_root2.png"),
                    fit: BoxFit.none,
                  ),
                  borderRadius:
                      const BorderRadius.only(topLeft: Radius.circular(20.0)),
                  border: Border.all(width: 0, color: Colors.transparent),
                  color: Colors.transparent),
            ))
          ],
        ),
      )),
    );
  }
}
