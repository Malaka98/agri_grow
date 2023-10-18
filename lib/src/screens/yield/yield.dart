import 'package:agry_go/src/repository/predict_repository.dart';
import 'package:flutter/material.dart';

import '../../widgets/back_btn_leading.dart';

class Yield extends StatefulWidget {
  const Yield({super.key});

  @override
  State<Yield> createState() => _YieldState();
}

class _YieldState extends State<Yield> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _txt = "";
  bool _isLoading = false;
  String _result = "Result";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonLeading(),
        leadingWidth: 100,
        toolbarHeight: 60,
        centerTitle: true,
          title: const Text("Yield Recommendation"),
          scrolledUnderElevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 30.0),
                    child: Container(
                        height: 250.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  spreadRadius: 1,
                                  blurRadius: 8,
                                  offset: const Offset(0, 1))
                            ]),
                        child: Container(
                          margin: const EdgeInsets.all(10.0),
                          child: _isLoading
                              ? const Center(child: CircularProgressIndicator())
                              : SingleChildScrollView(
                                  child: Text(
                                  _result,
                                  style: const TextStyle(fontSize: 16),
                                )),
                        )),
                  ),
                  TextFormField(
                    maxLength: 300,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Please text";
                      }
                      return null;
                    },
                    maxLines: 4,
                    decoration: const InputDecoration(
                        hintText:
                            "Please type in your query or describe the issue, and I'll provide recommendations accordingly",
                        contentPadding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                        border: OutlineInputBorder()),
                    onSaved: (value) {
                      _txt = value;
                    },
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.green.shade700,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              setState(() {
                                _isLoading = true;
                              });
                              yieldApi(_txt!).then((value) {
                                setState(() {
                                  _result = value.msg;
                                });
                              }).catchError((error) {
                                SnackBar snackBar;
                                snackBar = SnackBar(
                                    backgroundColor: Colors.redAccent.shade400,
                                    content: Text(
                                      error.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }).whenComplete(() {
                                setState(() {
                                  _isLoading = false;
                                });
                              });
                            }
                          },
                          child: const Text(
                              style: TextStyle(color: Colors.white), 'Submit')))
                ],
              ),
            )),
      ),
    );
  }
}
