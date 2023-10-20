import 'package:flutter/material.dart';

class SingUpFrom extends StatelessWidget {
  final Function loginHandlerCB;
  static final GlobalKey<FormState> _sinUpFormKey = GlobalKey<FormState>();
  static String? _username;
  static String? _password;
  static String? _confirm_password;

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
                return null;
              },
              decoration: const InputDecoration(
                  labelText: "Re-enter Password",
                  hintText: "Please Enter Password",
                  contentPadding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                  border: OutlineInputBorder()),
              onSaved: (value) {
                _confirm_password = value;
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
                    if (_sinUpFormKey.currentState!.validate()) {
                      _sinUpFormKey.currentState!.save();
                      loginHandlerCB(_username, _password);
                    }
                  },
                  child: const Text(
                      style: TextStyle(color: Colors.white), 'Sing Up'))),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
