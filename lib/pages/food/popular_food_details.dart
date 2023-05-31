import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../controller/cart_controller.dart';
import '../../controller/popular_product_controller.dart.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_color/app_colors.dart';
import '../../utils/app_icon/app_icon.dart';
import '../../utils/constants/app_constants.dart';
import '../../utils/dimensions/dimensions.dart';
import '../../widgets/app_column.dart';
import '../../widgets/custom_texts/big_text.dart';
import '../../widgets/custom_texts/expandable_text.dart';


class PopularFoodDetails extends StatelessWidget {
 final int pageId;
  final String page;
   PopularFoodDetails({Key? key,required this.pageId, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());
    print("page is id"+pageId.toString());
    print("product name is "+product.name.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //backgroundImage Section
          Positioned(
            left: 0,
            right: 0,
          child: Container(
            width: double.maxFinite,
            height: Dimensions.popularFoodImageSize,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
              image: NetworkImage(
                AppConstants.BASE_URL+AppConstants.UPLOAD_URl+product.img!
              )
              )
            ),
          ),
          ),
          //icon Section
          Positioned(
            top:Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
                  if (page=="cartPage") {
                    Get.toNamed(RouteHelper.getCartPage());
                  }else{
                    Get.toNamed(RouteHelper.initial);
                  }
                },
                child: AppIcon(
                icon: Icons.arrow_back_ios
                ),
              ),
             
              GetBuilder<PopularProductController>(
              builder: (controller){
                return GestureDetector(
                  onTap: (){
                    if (controller.totalItems>=1) {
                      Get.toNamed(RouteHelper.getCartPage());
                    }
                     
                  },
                  child: Stack(
                    children: [
                       AppIcon(
                        icon: Icons.shopping_cart_outlined
                      ),
                  Get.find<PopularProductController>().
                  totalItems>=1?Positioned(
                    right: 0,
                    top: 0,
                    child: AppIcon(
                    icon: Icons.circle,
                    size: 20,
                    iconColor: Colors.transparent,
                    backgroundColor: AppColor.mainColor,
                    ),
                  ):
                  Container(),
                   controller.
                  totalItems>=1?Positioned(
                    right: 3,
                    top: 3,
                    child:BigText(
                    title:
                     Get.find<PopularProductController>().
                     totalItems.toString(),
                     fontSize: 12,
                     color: Colors.white,
                    )
                  ):
                  Container(),
                    ],
                  ),
                );
              }
              )
            ],
          )
          ),
          //introduction of food
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImageSize-20,
          child: Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20,
              right: Dimensions.width20,
              top: Dimensions.height20
              ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20),
                topRight: Radius.circular(Dimensions.radius20),
              )
            ),
            child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(
                    title: product.name!
                    ),
                    SizedBox(height: Dimensions.height20,),
                    BigText(
                    title: "Introduce"
                    ),
                    SizedBox(height: Dimensions.height20,),
                     Expanded(
                       child: SingleChildScrollView(
                         child: ExpandableText(
                          title: product.description!
                          ),
                       ),
                     )
                  ],
                ),
          ),
          ),
        
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: ((popularProduct) {
          return Container(
          height: Dimensions.bottomHeightBar,
          padding: EdgeInsets.only(
          top: Dimensions.height30,
          bottom: Dimensions.height30,
          left: Dimensions.width20,
          right: Dimensions.width20
          ),
          decoration: BoxDecoration(
          color: AppColor.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2),
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
             padding: EdgeInsets.only(
              top: Dimensions.height20,
              bottom: Dimensions.height20,
              left: Dimensions.width20,
              right: Dimensions.width20
             ),
              decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius20) 
        ),
        child: Row(
          children: [
             GestureDetector(
              onTap: (){
                popularProduct.setQuantity(false);
              },
            child: Icon(Icons.remove,color: AppColor.signColor,)
            ),
            SizedBox(width: Dimensions.width10/2,),
            BigText(title: popularProduct.inCartItems.toString()),
            SizedBox(width: Dimensions.width10/2,),
            GestureDetector(
              onTap: (){
                popularProduct.setQuantity(true);
              },
            child: Icon(Icons.add,color: AppColor.signColor,)
            ),
          ],
           ),
            ),
             Container(
             padding: EdgeInsets.only(
              top: Dimensions.height20,
              bottom: Dimensions.height20,
              left: Dimensions.width10,
              // right: Dimensions.width10
             ),
              decoration: BoxDecoration(
          color: AppColor.mainColor,
          borderRadius: BorderRadius.circular(Dimensions.radius20) 
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: (){
                popularProduct.addItem(product);
              },
              child: BigText(
              title: "\$ ${product.price!} | Add to cart ",
              color: Colors.white,
              ),
            ),
          ],
        ),
            ),
          ],
        ),
        );
        }),
      
      ),
    );
  }
}