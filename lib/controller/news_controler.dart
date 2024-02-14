import 'package:get/get.dart';
import 'package:scud_networks_test/models/breaking_news_model.dart';
import 'package:scud_networks_test/models/categorywise_model.dart';
import 'package:scud_networks_test/models/recommendation_model.dart';
import 'package:scud_networks_test/services/api_services.dart';

class NewsController extends GetxController {
  var breakingNewsList = <ArticlesB>[].obs;
  var recommendationNewsList = <ArticlesR>[].obs;
  var categoryWiseNewsList = <ArticlesC>[].obs;
  var suggestionNewsList = <ArticlesC>[].obs;
  var isLoadingB = true.obs;
  var isLoadingR = true.obs;
  var isCategoryLoading = true.obs;
  var selectedCategory = ''.obs;

  @override
  void onInit() {
    super.onInit();
    selectedCategory.value = 'General';
    fetchBreakingNewsData();
    fetchRecommendationNewsData();
    fetchCategoryWiseNewsData('general');
  }

  Future<void> fetchBreakingNewsData() async {
    isLoadingB.value = true;
    final response = await ApiServices().fetchBreakingNewsData();
    breakingNewsList.value = response.articles!;
    isLoadingB.value = false;
  }

  Future<void> fetchRecommendationNewsData() async {
    isLoadingR.value = true;
    final response = await ApiServices().fetchRecommendationNewsData();
    recommendationNewsList.value = response.articles!;
    isLoadingR.value = false;
  }

  Future<void> fetchCategoryWiseNewsData(String category) async {
    isCategoryLoading.value = true;
    final response = await ApiServices().fetchCategoryWiseNewsData(category);
    categoryWiseNewsList.value = response.articles!;
    isCategoryLoading.value = false;
  }

  void filterNews(String query) {
    suggestionNewsList.value = categoryWiseNewsList
        .where(
            (news) => news.title!.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
