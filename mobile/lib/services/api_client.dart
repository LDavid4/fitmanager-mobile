import 'package:dio/dio.dart';

import '../config/env.dart';
import 'token_storage.dart';

/// Centralna Dio instanca za komunikaciju sa REST API-jem.
/// Interceptor automatski dodaje JWT token u Authorization zaglavlje,
/// a pri odgovoru 401 brise sacuvani token.
class ApiClient {
  ApiClient._();

  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: Env.apiUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ),
  )..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await TokenStorage.read();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            await TokenStorage.clear();
          }
          handler.next(error);
        },
      ),
    );
}
