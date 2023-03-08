import 'package:flutter/material.dart';
import 'package:food/controller/product_controller.dart';

import 'package:get/get.dart';
import 'controller/recommended_controller.dart';
import 'helper/dependencies.dart'as dep;
import 'home/main_food_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Get.find<ProductController>().getProductList();
    Get.find<RecommendedController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'Flutter Demo',
      theme: ThemeData(
       scaffoldBackgroundColor: Color(0xffE5E5E5)
      ),
      home:MainFoodPage()
    );
  }
}

