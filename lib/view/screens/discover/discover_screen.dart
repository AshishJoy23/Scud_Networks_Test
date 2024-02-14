import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scud_networks_test/controller/news_controler.dart';
import 'package:scud_networks_test/view/screens/screens.dart';
import '../../widgets/widgets.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  static const routeName = '/discover';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final newsController = Get.put(NewsController());
    return Scaffold(
      bottomNavigationBar: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            height: 1,
            thickness: 1,
          ),
          BottomNavBar(index: 1),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DiscoverHeadline(),
              SizedBox(
                height: size.width * 0.02,
              ),
              SearchBarWidget(
                newsController: newsController,
              ),
              SizedBox(
                height: size.width * 0.03,
              ),
              FadeInRight(
                child: CategoryList(
                  newsController: newsController,
                ),
              ),
              SizedBox(
                height: size.width * 0.03,
              ),
              Obx(
                () => newsController.isCategoryLoading.value
                    ? const LoadingIndicator(
                        color: Colors.black,
                      )
                    : FadeInUp(
                        delay: const Duration(milliseconds: 600),
                        child: CategoryWiseNews(newsController: newsController),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
