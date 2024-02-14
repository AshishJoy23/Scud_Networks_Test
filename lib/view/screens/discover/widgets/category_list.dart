import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/news_controler.dart';
import '../../../widgets/widgets.dart';

class CategoryList extends StatelessWidget {
  final NewsController newsController;
  const CategoryList({
    super.key,
    required this.newsController,
  });

  // String selectedcategory = 'General';

  @override
  Widget build(BuildContext context) {
    List<String> categoryList = [
      'General',
      'Business',
      'Entertainment',
      'Health',
      'Science',
      'Sports',
      'Technology'
    ];
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.05,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return Obx(
            () => CustomTag(
              backgroundColor:
                  newsController.selectedCategory.value == categoryList[index]
                      ? Colors.black
                      : Colors.grey,
              children: [
                InkWell(
                  onTap: () {
                    newsController.selectedCategory.value = categoryList[index];
                    // setState(() {
                    //   selectedcategory = categoryList[index];
                    // });
                    newsController
                        .fetchCategoryWiseNewsData(categoryList[index]);
                  },
                  child: Text(
                    categoryList[index],
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
