import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/popular_product_controller.dart.dart';
import '../../controller/recommended_controller.dart';
import '../../routes/route_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {


late  Animation<double> animation;
late  AnimationController controller;

 Future<void> _loadResource()async{
 await Get.find<PopularProductController>().getPopularProductList();
await  Get.find<RecommendedProductController>().getRecommendedProductList();
}


@override
  void initState() {
    super.initState();
    _loadResource();
    controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: 2))..forward();
    
    animation = CurvedAnimation(
    parent: controller,
     curve: Curves.linear
     );
     Timer(
      Duration(seconds:7), 
      ()=>Get.offNamed(RouteHelper.initial)
      );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
              image: AssetImage(
            "assets/images/food_logo.jpg"
            ),
            fit: BoxFit.cover
              )
            ),
            
          ),
          
          )
        ],
      ),
    );
  }
}