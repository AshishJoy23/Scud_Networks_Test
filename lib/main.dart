import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: '/splash',
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        DiscoverScreen.routeName: (context) => const DiscoverScreen(),
      },
    );
  }
}
