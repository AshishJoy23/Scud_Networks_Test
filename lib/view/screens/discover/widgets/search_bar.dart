import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scud_networks_test/controller/news_controler.dart';
import 'package:scud_networks_test/view/screens/search/search_screen.dart';

class SearchBarWidget extends StatelessWidget {
  final NewsController newsController;
  const SearchBarWidget({
    super.key,
    required this.newsController,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = new TextEditingController();
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.05,
      child: FlipInY(
        child: TextFormField(
          controller: textController,
          cursorColor: Colors.grey,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (value) {
            newsController.filterNews(textController.text.trim());
            Get.to(() => SearchScreen());
            textController.clear();
            newsController.fetchCategoryWiseNewsData(
                newsController.selectedCategory.value);
          },
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: const TextStyle(color: Colors.grey),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            contentPadding: const EdgeInsets.all(10),
            fillColor: Colors.grey.withAlpha(70),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(size.width / 2),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
