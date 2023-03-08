import 'package:food/controller/product_controller.dart';
import 'package:food/data/api/api_client.dart';
import 'package:food/data/repository/product_repo.dart';
import 'package:food/utils/constants/app_constants.dart';
import 'package:get/get.dart';

import '../controller/recommended_controller.dart';
import '../data/repository/recommended_repo.dart';

Future<void>init()async{

  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl:AppConstants.BASE_URL));

//repos
  Get.lazyPut(() => ProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedRepo(apiClient: Get.find()));

  //controllers
  Get.lazyPut(() => ProductController(productRepo: Get.find()));
  Get.lazyPut(() => RecommendedController(recommendedRepo: Get.find()));
}