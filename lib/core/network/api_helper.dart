import 'dart:developer';
import 'package:api/core/network/api_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiHelper {
  static Dio? dio;

  static void initDio() {
    dio ??= Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    dio!.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
      ),
    );
  }

  static Future<Response> getRequest({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    try {
      if (dio == null) initDio();

      final response = await dio!.get(endPoint, queryParameters: query);
      return response;
    } on DioException catch (e) {
      log('Dio Error: ${e.message}');
      rethrow;
    } catch (e) {
      log('Unexpected Error: $e');
      rethrow;
    }
  }
}
