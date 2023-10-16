import 'package:flutter/material.dart';

class LoginFrom extends StatelessWidget {
  final Function loginHandlerCB;
  static final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  static String? _username;
  static String? _password;

  const LoginFrom({Key? key, required this.loginHandlerCB}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginFormKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: TextFormField(
              maxLength: 30,
              // validator: (text) {
              //   return ref
              //       .read(authServiceProvider(ref))
              //       .usernameValidator(text);
              // },
              decoration: const InputDecoration(
                  labelText: "Name",
                  hintText: "Enter your Username",
                  contentPadding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                  border: OutlineInputBorder()),
              onSaved: (value) {
                _username = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: TextFormField(
              obscureText: true,
              maxLength: 20,
              // validator: (text) {
              //   return ref
              //       .read(authServiceProvider(ref))
              //       .passwordValidator(text);
              // },
              decoration: const InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your Password",
                  contentPadding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                  border: OutlineInputBorder()),
              onSaved: (value) {
                _password = value;
              },
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
                    if (_loginFormKey.currentState!.validate()) {
                      _loginFormKey.currentState!.save();
                      loginHandlerCB(_username, _password);
                    }
                  },
                  child: const Text(
                      style: TextStyle(color: Colors.white), 'Log In'))),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
