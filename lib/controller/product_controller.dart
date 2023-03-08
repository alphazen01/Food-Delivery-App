import 'package:food/data/repository/product_repo.dart';
import 'package:food/models/product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{

final ProductRepo productRepo;

ProductController({required this.productRepo});

List<dynamic>_productList =[];
List<dynamic> get productList =>_productList;


Future<void>getProductList()async{
 Response response= await productRepo.getProductList();
 if (response.statusCode==200) {
   _productList=[];
   _productList.addAll(Product.fromJson(response.body).products);
   print(_productList);
   update(); 
 } else {
   
 }
}


}