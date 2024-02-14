import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:scud_networks_test/core/constants.dart';
import 'package:scud_networks_test/models/breaking_news_model.dart';
import 'package:scud_networks_test/core/api_endpoinds.dart';
import 'package:scud_networks_test/models/categorywise_model.dart';
import 'package:scud_networks_test/models/recommendation_model.dart';

class ApiServices {
  
  Future<BreakingNewsModel> fetchBreakingNewsData() async{
    final response = await http.get(Uri.parse(ApiEndpoints.breakingNewsUrl));
    if (kDebugMode) {
      log(response.body);
    }
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return BreakingNewsModel.fromJson(body);
    }
    throw Exception('Error');
  }
  
  Future<RecommendationNewsModel> fetchRecommendationNewsData() async{
    final response = await http.get(Uri.parse(ApiEndpoints.recommendationUrl));
    if (kDebugMode) {
      log(response.body);
    }
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return RecommendationNewsModel.fromJson(body);
    }
    throw Exception('Error');
  }

  Future<CategoryWiseModel> fetchCategoryWiseNewsData(String categoryName) async{
    String url = "${ApiEndpoints.baseUrl}/everything?q=$categoryName&apiKey=$apiKey";
    final response = await http.get(Uri.parse(url));
    if (kDebugMode) {
      log(response.body);
    }
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return CategoryWiseModel.fromJson(body);
    }
    throw Exception('Error');
  }
}