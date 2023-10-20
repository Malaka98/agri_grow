import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routes/route_config.dart';

class SingUpFrom extends StatelessWidget {
  final Function loginHandlerCB;
  static final GlobalKey<FormState> _sinUpFormKey = GlobalKey<FormState>();
  static String? _email;
  static String? _name;
  static String? _password;

  const SingUpFrom({Key? key, required this.loginHandlerCB}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _sinUpFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: TextFormField(
              maxLength: 30,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "Please Enter name";
                }
                return null;
              },
              decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your Email",
                  contentPadding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                  border: OutlineInputBorder()),
              onSaved: (value) {
                _email = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: TextFormField(
              maxLength: 30,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "Please Enter Name";
                }
                return null;
              },
              decoration: const InputDecoration(
                  labelText: "Name",
                  hintText: "Enter your Name",
                  contentPadding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                  border: OutlineInputBorder()),
              onSaved: (value) {
                _name = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: TextFormField(
              obscureText: true,
              maxLength: 20,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "Please Enter Password";
                }
                return null;
              },
              decoration: const InputDecoration(
                  labelText: "Password",
                  hintText: "Please Enter Password",
                  contentPadding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                  border: OutlineInputBorder()),
              onChanged: (value) {
                _password = value;
              },
              onSaved: (value) {
                _password = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: TextFormField(
              obscureText: true,
              maxLength: 20,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "Please Enter Confirmation Password";
                }
                if (value != _password) {
                  return "Confirmation password does not match";
                }
                return null;
              },
              decoration: const InputDecoration(
                  labelText: "Re-enter Password",
                  hintText: "Please Enter Password",
                  contentPadding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                  border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.green.shade700,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: () {
                    if (_sinUpFormKey.currentState!.validate()) {
                      _sinUpFormKey.currentState!.save();
                      loginHandlerCB(_email, _name, _password);
                    }
                  },
                  child: const Text(
                      style: TextStyle(color: Colors.white), 'Sign Up'))),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("You have an account?"),
              InkWell(
                child: const Padding(
                  padding: EdgeInsets.only(left: 2.0),
                  child: Text(
                    "Please Login",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                onTap: () {
                  context.push(Routes.login.path);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
