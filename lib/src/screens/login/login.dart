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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Column(
              children: [
                Center(
                  child: Text(
                      style: TextStyle(
                          fontSize: 26.00,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600),
                      "Agri Grow"),
                ),
                Text(
                    style:
                        TextStyle(fontSize: 14.00, color: Colors.grey.shade600),
                    "Sign in to continue!")
              ],
            ),
            Container(
              margin: const EdgeInsets.all(24.0),
              child: LoginFrom(loginHandlerCB: loginHandler),
            ),
          ],
        ),
      ),
    ));
  }
}
