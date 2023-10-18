import 'dart:io';

import 'package:agry_go/src/model/predict_result.dart';
import 'package:agry_go/src/repository/predict_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/back_btn_leading.dart';

class DeficienciesView extends StatefulWidget {
  final XFile image;

  const DeficienciesView({Key? key, required this.image}) : super(key: key);

  @override
  State<DeficienciesView> createState() => _DeficienciesViewState();
}

class _DeficienciesViewState extends State<DeficienciesView> {
  bool isLoading = false;
  String label = "K Deficiency";
  String result = "Estimate K input from indigenous sources to assess "
      "site-specific K requirements.Increase K uptake by improving soil "
      "management practices on root health (e.g., deep tillage to improve "
      "percolation to at least 3-5 mm d-1 and to avoid excessively reducing "
      "conditions in soil).Establish an adequate population of healthy rice "
      "plants by using high-quality seed of a modern variety with multiple pest "
      "resistance, and optimum crop maintenance (water and pest management)."
      "Incorporate rice straw. If straw burning is the only option for crop "
      "residue management, spread the straw evenly over the field "
      "(e.g., as it is left after combine harvest) before burning. "
      "Ash from burnt straw heaps should also be spread over the field."
      "Apply optimum doses of N and P fertilizers and correct micronutrient "
      "deficiencies. Apply K fertilizers, farmyard manure, or other materials "
      "(rice husk, ash, night soil, compost) to replenish K removed in harvested "
      "crop products";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const BackButtonLeading(),
          leadingWidth: 100,
          toolbarHeight: 60,
        centerTitle: true,
        title: const Text("Deficiencies"),
          scrolledUnderElevation: 0),
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
            isLoading
                ? const CircularProgressIndicator()
                : ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 200),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    label,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                            Center(
                              child: Text(result,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
                          checkDeficiencies(widget.image)
                              .then((PredictResult value) {
                            setState(() {
                              result = value.detectionResults;
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
