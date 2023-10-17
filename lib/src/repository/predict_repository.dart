import 'dart:convert';

import 'package:agry_go/main.dart';
import 'package:agry_go/src/config/app_api_config.dart';
import 'package:agry_go/src/model/yield_result.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../model/predict_result.dart';

Future<PredictResult> checkDiseases(XFile image) async {
  final FormData formData = FormData.fromMap({
    'image': await MultipartFile.fromFile(image.path, filename: image.name)
  });
  final response =
      await dio.post(AppAPIConfig.detectDiseaseApi, data: formData);
  return PredictResult.fromJson(response.data);
}

Future<PredictResult> checkPets(XFile image) async {
  final FormData formData = FormData.fromMap({
    'image': await MultipartFile.fromFile(image.path, filename: image.name)
  });
  final response = await dio.post(AppAPIConfig.detectPetsApi, data: formData);
  return PredictResult.fromJson(response.data);
}

Future<PredictResult> checkDeficiencies(XFile image) async {
  final FormData formData = FormData.fromMap({
    'image': await MultipartFile.fromFile(image.path, filename: image.name)
  });
  final response = await dio.post(AppAPIConfig.deficienciesApi, data: formData);
  return PredictResult.fromJson(response.data);
}

Future<YieldResult> yieldApi(String msg) async {
  final response = await dio.post(AppAPIConfig.yieldApi, data: {"msg": msg});
  return YieldResult.fromJson(jsonDecode(response.data));
}