import 'package:flutter/material.dart';


import 'package:get/get.dart';

import '../../base/no_data_page.dart';
import '../../controller/cart_controller.dart';
import '../../controller/popular_product_controller.dart.dart';
import '../../controller/recommended_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_color/app_colors.dart';
import '../../utils/app_icon/app_icon.dart';
import '../../utils/constants/app_constants.dart';
import '../../utils/dimensions/dimensions.dart';
import '../../widgets/custom_texts/big_text.dart';
import '../../widgets/custom_texts/small_text.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        
        children: [
          //header section
          Positioned(
            top: Dimensions.height20*3,
            left: Dimensions.width20,
            right: Dimensions.width20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(
              icon: Icons.arrow_back_ios,
              iconColor: Colors.white,
              backgroundColor: AppColor.mainColor,
              iconSize: Dimensions.iconSize24,
              ),
              SizedBox(width: Dimensions.width20*5,),
               GestureDetector(
                onTap: (){
                  Get.toNamed(RouteHelper.getInitial());
                },
                 child: AppIcon(
                icon: Icons.home_outlined,
                iconColor: Colors.white,
                backgroundColor: AppColor.mainColor,
                iconSize: Dimensions.iconSize24,
                ),
               ),
               AppIcon(
              icon: Icons.shopping_cart,
              iconColor: Colors.white,
              backgroundColor: AppColor.mainColor,
              iconSize: Dimensions.iconSize24,
              ),
            ],
          ),
          ),

          //body section
          GetBuilder<CartController>(
            builder: (_cartController) {
              return _cartController.getItems.length>0? 
              Positioned(
               top: Dimensions.height20*5,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height15),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(
                  builder: (cartController) {
                    var _cartList = cartController.getItems;
                    return ListView.builder(
                    itemCount: _cartList.length,
                  itemBuilder: ( (context, index) {
                   return Container(
                    margin: EdgeInsets.only(bottom: Dimensions.height10),
                    height:Dimensions.height20*5,
                    width: double.maxFinite,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: (){
                            var popularIndex = Get.find<PopularProductController>().
                            popularProductList.indexOf(_cartList[index].product!);
                            if (popularIndex>=0) {
                              Get.toNamed(RouteHelper.getPopularFood(popularIndex,"cartPage"));
                            } else {
                               var recommendedIndex = Get.find<RecommendedProductController>().
                            recommendedProductList.indexOf(_cartList[index].product!);
                            // Get.toNamed(RouteHelper.getRecommendedFood(recommendedIndex,"cartPage"));
                            if (recommendedIndex<0) {
                               Get.snackbar(
                            "History Product", "Product review is not availble for history products",
                            backgroundColor: AppColor.mainColor,
                            colorText: Colors.white
                            );
                              
                            } else {
                                Get.toNamed(RouteHelper.getRecommendedFood(recommendedIndex,"cartPage"));
                            }
                            }
                          },
                          child: Container(
                            width: Dimensions.height20*5,
                            height: Dimensions.height20*5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                              color: Colors.white,
                              image: DecorationImage(
                              image: NetworkImage(
                                AppConstants.BASE_URL+AppConstants.UPLOAD_URl+cartController.getItems[index].img!
                              ),
                              fit: BoxFit.cover
                              )
                            ),
                          ),
                        ),
                        SizedBox(width:Dimensions.width10),
                        Expanded(
                          child: Container(
                            height: Dimensions.height20*5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                BigText(
                                title: cartController.getItems[index].name!,
                                color: Colors.black54,
                                ),
                                SmallText(
                                title:"Spicy" 
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                   BigText(
                                title: "\$ ${cartController.getItems[index].price!.toString()}",
                                color: Colors.redAccent,
                                ),
                                Container(
                                padding: EdgeInsets.only(
                                  top: Dimensions.height10,
                                  bottom: Dimensions.height10,
                                  left: Dimensions.width10,
                                  right: Dimensions.width10
                                ),
                                  decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(Dimensions.radius20) 
                            ),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                   cartController.addItem(_cartList[index].product!, -1 );
                                  
                                  },
                                child: Icon(Icons.remove,color: AppColor.signColor,)
                                ),
                                SizedBox(width: Dimensions.width10/2,),
                                BigText(title:_cartList[index].quantity.toString()),// popularProduct.inCartItems.toString()),
                                SizedBox(width: Dimensions.width10/2,),
                                GestureDetector(
                                  onTap: (){
                                    cartController.addItem(_cartList[index].product!, 1 );
                                    
                                  },
                                child: Icon(Icons.add,color: AppColor.signColor,)
                                ),
                              ],
                              ),
                                ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                   ); 
                  })
                  );
                  },
                 
                ),
              ),
            ),
            ):NoDataPage(
            text: "Your cart is empty!"
            );
            },
             
          ),

        ],
      ),
      
       bottomNavigationBar: GetBuilder<CartController>(
        builder: ((cartController) {
          return Container(
          height: Dimensions.bottomHeightBar,
          padding: EdgeInsets.only(
          top: Dimensions.height30,
          bottom: Dimensions.height30,
          left: Dimensions.width20,
          right: Dimensions.width20
          ),
          decoration: BoxDecoration(
          color:cartController.getItems.length>0?
           AppColor.buttonBackgroundColor:
           Color(0xffE5E5E5),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimensions.radius20*2),
            topRight: Radius.circular(Dimensions.radius20*2),
          )
        ),
        child:cartController.getItems.length>0?
         Row(
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
            
            SizedBox(width: Dimensions.width10/2,),
            BigText(title:"\$ "+cartController.totalAmount.toString()),
            SizedBox(width: Dimensions.width10/2,),
           
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
            GestureDetector(
              onTap: (){
                
              //  if (Get.find<AuthController>().userLoggedIn()) {
                
              //    cartController.addToHistory();
              //  } else {
              //    Get.toNamed(RouteHelper.getSignInPage());
              //  }
              cartController.addToHistory();
                
              },
              child: BigText(
              title: "Check out",
              color: Colors.white,
              ),
            ),
          ],
        ),
            ),
          ],
        ):Container(),
        );
        }),
      
      ),

    );
  }
}