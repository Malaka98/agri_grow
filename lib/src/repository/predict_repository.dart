import 'package:agry_go/main.dart';
import 'package:agry_go/src/config/app_api_config.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

Future<dynamic> checkDiseases(XFile image) async {
  final FormData formData = FormData.fromMap({
    'image': await MultipartFile.fromFile(image.path, filename: image.name)
  });
  final response =
      await dio.post(AppAPIConfig.detectDiseaseApi, data: formData);
  return response.data;
}

Future<dynamic> checkPets(XFile image) async {
  final FormData formData = FormData.fromMap({
    'image': await MultipartFile.fromFile(image.path, filename: image.name)
  });
  final response = await dio.post(AppAPIConfig.detectPetsApi, data: formData);
  return response.data;
}

Future<dynamic> checkDeficiencies(XFile image) async {
  final FormData formData = FormData.fromMap({
    'image': await MultipartFile.fromFile(image.path, filename: image.name)
  });
  final response = await dio.post(AppAPIConfig.deficienciesApi, data: formData);
  return response.data;
}