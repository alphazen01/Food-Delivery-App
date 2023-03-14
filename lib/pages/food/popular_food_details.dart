import 'package:flutter/material.dart';
import 'package:food/controller/popular_product_controller.dart.dart';
import 'package:food/pages/home/main_food_page.dart';
import 'package:food/utils/app_icon/app_icon.dart';
import 'package:food/utils/constants/app_constants.dart';
import 'package:food/utils/dimensions/dimensions.dart';
import 'package:food/widgets/app_column.dart';
import 'package:get/get.dart';

import '../../utils/app_color/app_colors.dart';
import '../../widgets/custom_texts/big_text.dart';
import '../../widgets/custom_texts/expandable_text.dart';


class PopularFoodDetails extends StatelessWidget {
  int pageId;
   PopularFoodDetails({Key? key,required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
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
                  Get.to(()=>MainFoodPage());
                },
                child: AppIcon(
                icon: Icons.arrow_back_ios
                ),
              ),
              AppIcon(
              icon: Icons.shopping_cart_outlined
              ),
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
      bottomNavigationBar: Container(
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
          Icon(Icons.remove,color: AppColor.signColor,),
          SizedBox(width: Dimensions.width10/2,),
          BigText(title: "0"),
          SizedBox(width: Dimensions.width10/2,),
          Icon(Icons.add,color: AppColor.signColor,),
        ],
      ),
          ),
           Container(
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
        ],
      ),
      ),
    );
  }
}