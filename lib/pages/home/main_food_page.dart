
import 'package:flutter/material.dart';
import 'package:food_app/pages/home/food_page_body.dart';

import 'package:get/get.dart';

import '../../controller/popular_product_controller.dart.dart';
import '../../controller/recommended_controller.dart';
import '../../utils/app_color/app_colors.dart';
import '../../utils/dimensions/dimensions.dart';
import '../../widgets/custom_texts/big_text.dart';
import '../../widgets/custom_texts/small_text.dart';



class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
   Future<void> _loadResource()async{
 await Get.find<PopularProductController>().getPopularProductList();
await  Get.find<RecommendedProductController>().getRecommendedProductList();
}
  @override
  Widget build(BuildContext context) {
    print("screen=" +MediaQuery.of(context).size.height.toString());
    return RefreshIndicator(
    child: Column(
       children: [
        //showing the header
         Container(
          margin: EdgeInsets.only(top: Dimensions.height45,bottom: Dimensions.height15),
          padding: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children:[
                     BigText(
                      title: "Bangladesh",
                      color: AppColor.mainColor,
                      ),
                     Row(
                      children: [
                         SmallText(
                      title: "Dhaka",
                      color: Colors.black54,
                      ),
                      Icon(
                      Icons.arrow_drop_down_rounded,
                      )
                      ],
                     )
                    ]
                  ),
                  Container(
                    width:Dimensions.width45,
                    height: Dimensions.height45,
                    child: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: Dimensions.iconSize24,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: AppColor.mainColor
                    ),
                  ),
                ],
              ),
            ),
            
          ),
          //showing the body
          Expanded(
            child: SingleChildScrollView(
            child: FoodPageBody()
            ),
          ),

       ],
     ), 
    onRefresh: _loadResource
    );
  }
}