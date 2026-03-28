import 'dart:developer';
import 'package:api/core/constant/constant.dart';
import 'package:api/core/network/api_endpoints.dart';
import 'package:api/core/network/api_helper.dart';
import 'package:api/features/home/models/top_head_lines_model.dart';
import 'package:dio/dio.dart';

class HomeScreenServices {
  Future<TopHeadLinesModel?> getTopHeadLines() async {
    try {
      final Response response = await ApiHelper.getRequest(
        endPoint: ApiEndpoints.topHeadlinesEndpoints,
        query: {'apiKey': AppConstant.apiKey, 'country': 'us'},
      );

      if (response.statusCode == 200) {
        return TopHeadLinesModel.fromJson(response.data);
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
    return null;
  }
}
