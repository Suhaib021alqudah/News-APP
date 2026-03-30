import 'dart:developer';
import 'package:api/core/constant/constant.dart';
import 'package:api/core/network/api_endpoints.dart';
import 'package:api/core/network/api_helper.dart';
import 'package:api/features/home/models/top_head_lines_model.dart';
import 'package:dio/dio.dart';

class ResultServices {
  Future<GenralArticlsModels?> searchItemByName(String query) async {
    try {
      final Response response = await ApiHelper.getRequest(
        endPoint: ApiEndpoints.searchEndPoint,
        query: {'apiKey': AppConstant.apiKey, 'q': query},
      );

      if (response.statusCode == 200) {
        return GenralArticlsModels.fromJson(response.data);
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
    return null;
  }
}
