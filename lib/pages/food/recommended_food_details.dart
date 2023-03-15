import 'package:flutter/material.dart';
import 'package:food/controller/recommended_controller.dart';
import 'package:food/routes/route_helper.dart';
import 'package:food/utils/app_color/app_colors.dart';
import 'package:food/utils/app_icon/app_icon.dart';
import 'package:food/utils/constants/app_constants.dart';
import 'package:food/utils/dimensions/dimensions.dart';
import 'package:food/widgets/custom_texts/big_text.dart';
import 'package:food/widgets/custom_texts/expandable_text.dart';
import 'package:get/get.dart';

class RecommendedFoodDetails extends StatelessWidget {
  final int pageId;
  const RecommendedFoodDetails({Key? key,required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =Get.find<RecommendedProductController>().recommendedProductList[pageId];
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
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                  icon: Icons.clear
                  ),
                ),
                AppIcon(
                icon: Icons.shopping_cart_outlined
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
      bottomNavigationBar: Column(
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
                AppIcon(
                icon: Icons.remove,
                backgroundColor: AppColor.mainColor,
                iconColor: Colors.white,
                iconSize: Dimensions.iconSize24,
                ),
                BigText(
                title: "\$ ${product.price}  X  0 ",
                color: AppColor.mainBlackColor,
                fontSize: Dimensions.font26,
                ),
                AppIcon(
                icon: Icons.add,
                backgroundColor: AppColor.mainColor,
                iconColor: Colors.white,
                iconSize: Dimensions.iconSize24,
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
        ]
      ),

    );
  }
}