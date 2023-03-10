import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food/utils/app_icon/app_icon.dart';
import 'package:food/utils/dimensions/dimensions.dart';
import 'package:food/widgets/app_column.dart';

import '../../utils/app_color/app_colors.dart';
import '../../widgets/custom_texts/big_text.dart';
import '../../widgets/custom_texts/expandable_text.dart';
import '../../widgets/custom_texts/icon_text_widget.dart';
import '../../widgets/custom_texts/small_text.dart';

class PopularFoodDetails extends StatelessWidget {
  const PopularFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              image: AssetImage("assets/images/testy_burger.jpg")
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
              AppIcon(
              icon: Icons.arrow_back_ios
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
                    title: "Chinese Side"
                    ),
                    SizedBox(height: Dimensions.height20,),
                    BigText(
                    title: "Introduce"
                    ),
                    SizedBox(height: Dimensions.height20,),
                     Expanded(
                       child: SingleChildScrollView(
                         child: ExpandableText(
                          title: "food, substance consisting essentially of protein, carbohydrate, fat, and other nutrients used in the body of an organism to sustain growth and vital processes and to furnish energy. The absorption and utilization of food by the body is fundamental to nutrition and is facilitated by digestion.food, substance consisting essentially of protein, carbohydrate, fat, and other nutrients used in the body of an organism to sustain growth and vital processes and to furnish energy. The absorption and utilization of food by the body is fundamental to nutrition and is facilitated by digestion.food, substance consisting essentially of protein, carbohydrate, fat, and other nutrients used in the body of an organism to sustain growth and vital processes and to furnish energy. The absorption and utilization of food by the body is fundamental to nutrition and is facilitated by digestion.food, substance consisting essentially of protein, carbohydrate, fat, and other nutrients used in the body of an organism to sustain growth and vital processes and to furnish energy. The absorption and utilization of food by the body is fundamental to nutrition and is facilitated by digestion."
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
          title: "\$10 | Add to cart",
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