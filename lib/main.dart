import 'package:flutter/material.dart';
import 'package:food_app/controller/cart_controller.dart';
import 'package:food_app/pages/home/home_page.dart';
import 'package:food_app/routes/route_helper.dart';

import 'package:get/get.dart';
import 'controller/popular_product_controller.dart.dart';
import 'controller/recommended_controller.dart';
import 'helper/dependencies.dart'as dep;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    Get.find<CartController>().getCartData
    ();
    return GetBuilder<PopularProductController>(
    builder: (_){
      return GetBuilder<RecommendedProductController>(
    builder: (_){
      return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'Flutter Demo',
      theme: ThemeData(
       scaffoldBackgroundColor: Color(0xffE5E5E5)
      ),
      //  home: SplashScreen(),
      initialRoute: RouteHelper.getSplashScreen(),
      getPages: RouteHelper.routes,
      home:HomePage()
     

    );
    }
    );
    }
    );
  }
}

