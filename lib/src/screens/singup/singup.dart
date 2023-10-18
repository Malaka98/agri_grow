import 'package:agry_go/src/screens/singup/widgets/reg_form.dart';
import 'package:flutter/material.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  void loginHandler(username, password) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/login.png"), fit: BoxFit.cover)),
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100.0),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text("sing Up to", style: TextStyle(fontSize: 24)),
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
                        child: SingUpFrom(loginHandlerCB: loginHandler),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
