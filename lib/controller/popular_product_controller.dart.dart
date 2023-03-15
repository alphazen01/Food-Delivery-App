import 'package:flutter/material.dart';
import 'package:food/data/repository/popular_product_repo.dart';
import 'package:food/models/popular_products_model.dart.dart';
import 'package:food/utils/app_color/app_colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{

final PopularProductRepo popularProductRepo;

PopularProductController({required this.popularProductRepo});

List<dynamic>_poularProductList =[];
List<dynamic> get popularProductList =>_poularProductList;

bool _isLoaded = false;
bool get isLoaded => _isLoaded;
int _quantity =0;
int get quantity =>_quantity;
int _inCartItems=0;
int get inCartItems => _inCartItems+_quantity;


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

void setQuantity(bool isIncrement){
  if (isIncrement) {
    print("increment"+_quantity.toString());
    _quantity = checkQuantity(quantity+1);
  } else {
    print("decrement"+_quantity.toString());
    _quantity = checkQuantity(quantity-1);
  }
  update();
}
int  checkQuantity(int quantity){
  if (quantity<0) {
    Get.snackbar(
    "Item Count", "You can't reduce more!",
    backgroundColor: AppColor.mainColor,
    colorText: Colors.white
    );
    return 0;
    
  } else if(quantity>20) {
     Get.snackbar(
    "Item Count", "You can't add more!",
    backgroundColor: AppColor.mainColor,
    colorText: Colors.white
    );
    return 20;
  }else{
 return quantity;
  }
}

void initProduct(){
  _quantity=0;
  _inCartItems=0;
  //get from storage _inCartItems
}

}