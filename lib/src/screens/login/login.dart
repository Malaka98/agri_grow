import 'package:agry_go/src/routes/route_config.dart';
import 'package:agry_go/src/screens/login/widgets/login_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void loginHandler(username, password) async {
    SnackBar snackBar;
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: username, password: password);
      if (context.mounted) context.push(Routes.dashboard.path);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        if (context.mounted) {
          snackBar = SnackBar(
              backgroundColor: Colors.redAccent.shade400,
              content: const Text(
                "Invalid Email",
                style: TextStyle(fontWeight: FontWeight.bold),
              ));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        if (context.mounted) {
          snackBar = SnackBar(
              backgroundColor: Colors.redAccent.shade400,
              content: const Text(
                "Invalid credentials",
                style: TextStyle(fontWeight: FontWeight.bold),
              ));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0)),
                image: DecorationImage(
                    image: AssetImage("assets/login.png"), fit: BoxFit.none)),
            height: MediaQuery.of(context).size.height / 2,
          ),
          Flexible(
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
            ),
          ))
        ],
      )),
    );
  }
}
