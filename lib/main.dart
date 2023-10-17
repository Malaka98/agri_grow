import 'package:agry_go/src/config/app_api_config.dart';
import 'package:agry_go/src/config/app_setting_config.dart';
import 'package:agry_go/src/routes/route_config.dart';
import 'package:agry_go/src/utils/dio_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();

Future<void> configureDio() async {
  // Set default configs
  dio.options.baseUrl = AppAPIConfig.baseUrl;
  dio.options.connectTimeout = const Duration(seconds: 180);
  dio.options.receiveTimeout = const Duration(seconds: 180);
  dio.interceptors.add(InterceptorsWrapper(
    onError: (DioException e, handler) {
      var error = DioExceptionInterceptor.fromDioError(e);
      throw error.errorMessage;
    },
  ));
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: routerConfig,
      debugShowCheckedModeBanner: AppSettingConfig.debugMode,
      title: AppSettingConfig.appTitle,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.lightGreen,
          outline: Colors.lightGreen.shade600,
          primary: Colors.lightGreen,
          secondary: Colors.lightGreen,
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
        useMaterial3: true,
      ),
    );
  }
}
