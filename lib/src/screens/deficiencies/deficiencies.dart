import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../routes/route_config.dart';
import '../../widgets/back_btn_leading.dart';

class Deficiencies extends StatefulWidget {
  const Deficiencies({super.key});

  @override
  State<Deficiencies> createState() => _DeficienciesState();
}

class _DeficienciesState extends State<Deficiencies> {
  late XFile _image;
  final ImagePicker picker = ImagePicker();

  //Image Picker function to get image from gallery
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = XFile(pickedFile.path);
      }
    });
  }

  //Image Picker function to get image from camera
  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = XFile(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackButtonLeading(),
          leadingWidth: 100,
          toolbarHeight: 60,
          centerTitle: true,
          title: const Text("Diseases"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  height: 150.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 8,
                            offset: const Offset(0, 1))
                      ])),
            ),
            const Text(
              "Touch To Identify",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10.0),
            Flexible(
                child: SizedBox(
              height: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.lightGreenAccent.shade400,
                      size: 52,
                    ),
                    onTap: () {
                      getImageFromCamera().then((value) {
                        context.push(Routes.diseasesView.path, extra: _image);
                      });
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    child: InkWell(
                      child: Icon(
                        Icons.photo_library_outlined,
                        color: Colors.lightGreenAccent.shade400,
                        size: 100,
                      ),
                      onTap: () {
                        getImageFromGallery().then((value) {
                          context.push(Routes.diseasesView.path, extra: _image);
                        });
                      },
                    ),
                  )
                ],
              ),
            ))
          ],
        ));
  }
}
