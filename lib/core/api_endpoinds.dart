import 'package:scud_networks_test/core/constants.dart';

class ApiEndpoints {
  static String baseUrl = "https://newsapi.org/v2";
  static String recommendationUrl = "$baseUrl/everything?sources=bbc-news&apiKey=$apiKey";
  static String breakingNewsUrl = "$baseUrl/top-headlines?sources=bbc-news&apiKey=$apiKey";
  // String categoryUrl = "https://newsapi.org/v2/everything?q=general&apiKey=d0034811f24749c4b157ab10a20d1d81";
  // String categoryUrl1 = "https://newsapi.org/v2/top-headlines/sources?category=Sports&apiKey=d0034811f24749c4b157ab10a20d1d81";
}