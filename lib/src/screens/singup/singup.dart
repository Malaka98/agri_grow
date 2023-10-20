import 'package:agry_go/src/screens/singup/widgets/reg_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  void loginHandler(username, password) async {
    SnackBar snackBar;
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: username,
        password: password,
      );
      if (credential.user?.uid != null) {
        CollectionReference users =
            FirebaseFirestore.instance.collection('user');
        users.add({"uid": credential.user?.uid});
      }
    } on FirebaseAuthException catch (e) {
      snackBar = SnackBar(
          backgroundColor: Colors.redAccent.shade400,
          content: Text(
            e.message ?? "Internal Error",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ));
      if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // if (e.code == 'weak-password') {
      //   print('The password provided is too weak.');
      // } else if (e.code == 'email-already-in-use') {
      //   print('The account already exists for that email.');
      // }
    } catch (e) {
      snackBar = SnackBar(
          backgroundColor: Colors.redAccent.shade400,
          content: const Text(
            "Internal Error",
            style: TextStyle(fontWeight: FontWeight.bold),
          ));
      if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
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
        SingleChildScrollView(
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
        )
      ],
    )));
  }
}
