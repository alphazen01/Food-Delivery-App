import 'package:food/controller/popular_product_controller.dart.dart';
import 'package:food/data/api/api_client.dart';
import 'package:food/data/repository/popular_product_repo.dart';
import 'package:food/utils/constants/app_constants.dart';
import 'package:get/get.dart';

import '../controller/recommended_controller.dart';
import '../data/repository/recommended_product_repo.dart.dart';

Future<void>init()async{

  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl:AppConstants.BASE_URL));

//repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepo: Get.find()));
}