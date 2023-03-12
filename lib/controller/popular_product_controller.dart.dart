import 'package:food/data/repository/popular_product_repo.dart';
import 'package:food/models/popular_products_model.dart.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{

final PopularProductRepo popularProductRepo;

PopularProductController({required this.popularProductRepo});

List<dynamic>_poularProductList =[];
List<dynamic> get popularProductList =>_poularProductList;

bool _isLoaded = false;
bool get isLoaded => _isLoaded;


Future<void>getPopularProductList()async{
 Response response= await popularProductRepo.getPopularProductList();
 if (response.statusCode==200) {
   _poularProductList=[];
   _poularProductList.addAll(Product.fromJson(response.body).products);
   print( _poularProductList);
   print(_poularProductList.length);
   _isLoaded = true;
   update(); 
 } else {
   
 }
}


}