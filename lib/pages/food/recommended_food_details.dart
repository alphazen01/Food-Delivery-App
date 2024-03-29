import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../controller/cart_controller.dart';
import '../../controller/popular_product_controller.dart.dart';
import '../../controller/recommended_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_color/app_colors.dart';
import '../../utils/app_icon/app_icon.dart';
import '../../utils/constants/app_constants.dart';
import '../../utils/dimensions/dimensions.dart';
import '../../widgets/custom_texts/big_text.dart';
import '../../widgets/custom_texts/expandable_text.dart';

class RecommendedFoodDetails extends StatelessWidget {
  final int pageId;
  final String page;
  const RecommendedFoodDetails({Key? key,required this.pageId, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =Get.find<RecommendedProductController>().recommendedProductList[pageId];
      Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
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
                  icon: Icons.clear
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
                   Get.find<PopularProductController>().
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
            ),
            bottom: PreferredSize(
            child: Container(
              child:Center(
              child: BigText(
              title: product.name!,
              fontSize: Dimensions.font26,
              )
              ),
              
              width: double.maxFinite,
              padding: EdgeInsets.only(top:5,bottom: 10,),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20),
                  topRight: Radius.circular(Dimensions.radius20),
                )
              ),
            ), 
            preferredSize: Size.fromHeight(20)
            ),
            pinned: true,
            backgroundColor:AppColor.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL+AppConstants.UPLOAD_URl+product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                  child: ExpandableText(
                  title: product.description!
                  ),
                ),
              ],
            )
          )
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: ((controller) {
          return Column(
          mainAxisSize: MainAxisSize.min,
          children:[
            Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20*2.5,
                right: Dimensions.width20*2.5,
                top: Dimensions.height10,
                bottom: Dimensions.height10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      controller.setQuantity(false);
                    },
                    child: AppIcon(
                    icon: Icons.remove,
                    backgroundColor: AppColor.mainColor,
                    iconColor: Colors.white,
                    iconSize: Dimensions.iconSize24,
                    ),
                  ),
                  BigText(
                  title: "\$ ${product.price}  X  ${controller.inCartItems} ",
                  color: AppColor.mainBlackColor,
                  fontSize: Dimensions.font26,
                  ),
                  GestureDetector(
                    onTap: (){
                      controller.setQuantity(true);
      
                    },
                    child: AppIcon(
                    icon: Icons.add,
                    backgroundColor: AppColor.mainColor,
                    iconColor: Colors.white,
                    iconSize: Dimensions.iconSize24,
                    ),
                  ),
                ],
              ),
            ),
            Container(
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
        child: Icon(
          Icons.favorite,
          color: AppColor.mainColor,
           )
            ),
             GestureDetector(
              onTap: (){
                controller.addItem(product);
              },
               child: Container(
               padding: EdgeInsets.only(
                top: Dimensions.height20,
                bottom: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20
               ),
                decoration: BoxDecoration(
                       color: AppColor.mainColor,
                       borderRadius: BorderRadius.circular(Dimensions.radius20) 
                     ),
                     child: Row(
                       children: [
                         BigText(
                         title: "\$ ${product.price!} | Add to cart",
                         color: Colors.white,
                         ),
                       ],
                     ),
                         ),
             ),
          ],
        ),
        ),
          ]
        );
        }),
 
      ),

    );
  }
}