import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scud_networks_test/view/screens/screens.dart';
import 'package:scud_networks_test/view/screens/search/search_screen.dart';
import '../../../controller/news_controler.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final newsController = Get.put(NewsController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('news9',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 30,
            )),
        elevation: 0,
        leading: BounceInDown(
          child: Padding(
            padding: EdgeInsets.all(size.width * 0.02),
            child: AppRoundedButton(
              onTap: () async {
              },
              iconData: Icons.grid_view_sharp,
            ),
          ),
        ),
        actions: [
          BounceInDown(
            child: AppRoundedButton(
              onTap: () {},
              iconData: Icons.more_vert,
            ),
          ),
          SizedBox(width: size.width * 0.02),
        ],
      ),
      bottomNavigationBar: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            height: 1,
            thickness: 1,
          ),
          BottomNavBar(index: 0),
        ],
      ),
      //extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Obx(
          () => (newsController.isLoadingR.value)
              ? const LoadingIndicator(
                  color: Colors.black,
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      FadeInLeft(
                        child: HomeHeading(
                          title: 'Breaking News',
                          trailing: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'View All',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      FadeInLeft(child: const HomeCarousel()),
                      FadeInLeft(
                        child: HomeHeading(
                          title: 'Recommendation',
                          trailing: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'View All',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      FadeInUp(
                          child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: HomeNewsListView(),
                      ))
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
