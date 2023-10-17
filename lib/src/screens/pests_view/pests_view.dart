import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../repository/predict_repository.dart';
import '../../widgets/back_btn_leading.dart';

class PestsView extends StatefulWidget {
  final XFile image;

  const PestsView({Key? key, required this.image}) : super(key: key);

  @override
  State<PestsView> createState() => _PestsViewState();
}

class _PestsViewState extends State<PestsView> {
  bool isLoading = false;
  String result = "Identify your Plant's Deficiencies";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const BackButtonLeading(),
          leadingWidth: 100,
          toolbarHeight: 60,
          centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 300.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: const Offset(0, 1))
                  ]),
              child: Image.file(File(widget.image.path)),
            ),
            isLoading ? const CircularProgressIndicator() : Text(result),
            Column(
              children: [
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                                side: const BorderSide(
                                    color: Colors.green, width: 1.5))),
                        onPressed: () {
                          context.pop();
                        },
                        child: const Text(
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            'Capture another image'))),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.green.shade700,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        onPressed: () {
                          setState(() {
                            isLoading = true;
                          });
                          checkPets(widget.image).then((value) {
                            setState(() {
                              result = value['detection_result'];
                            });
                          }).whenComplete(() {
                            setState(() {
                              isLoading = false;
                            });
                          });
                        },
                        child: const Text(
                            style: TextStyle(color: Colors.white), 'Upload')))
              ],
            )
          ],
        ),
      ),
    );
  }
}
