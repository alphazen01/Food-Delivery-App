
import 'package:food/models/product_model.dart';
import 'package:get/get.dart';

import '../data/repository/recommended_repo.dart';

class RecommendedController extends GetxController{

final RecommendedRepo recommendedRepo;

RecommendedController({required this.recommendedRepo});

List<dynamic>_recommendedList =[];
List<dynamic> get recommendedList =>_recommendedList;




Future<void>getRecommendedProductList()async{
 Response response= await recommendedRepo.getRecommendedProductList();
 if (response.statusCode==200) {
   _recommendedList=[];
   _recommendedList.addAll(Product.fromJson(response.body).products);
   print(_recommendedList);
   update(); 
 } else {
   
 }
}


}