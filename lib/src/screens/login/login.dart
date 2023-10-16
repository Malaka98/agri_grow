import 'package:agry_go/src/routes/route_config.dart';
import 'package:agry_go/src/screens/login/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void loginHandler(username, password) {
    context.push(Routes.dashboard.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100.0),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text("Log In to", style: TextStyle(fontSize: 24)),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, bottom: 20.0),
            child: Text(
              "Agri Grow",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: const Offset(0, 1))
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                        style: TextStyle(
                          fontSize: 14.00,
                          color: Colors.grey.shade600,
                        ),
                        textAlign: TextAlign.start,
                        "Please log in to your account to continue:"),
                  ),
                  Container(
                    margin: const EdgeInsets.all(24.0),
                    child: LoginFrom(loginHandlerCB: loginHandler),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    ));
  }
}
