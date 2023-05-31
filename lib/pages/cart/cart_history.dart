import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../base/no_data_page.dart';
import '../../controller/cart_controller.dart';
import '../../models/cart_model.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_color/app_colors.dart';
import '../../utils/app_icon/app_icon.dart';
import '../../utils/constants/app_constants.dart';
import '../../utils/dimensions/dimensions.dart';
import '../../widgets/custom_texts/big_text.dart';
import '../../widgets/custom_texts/small_text.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    

    var getCartHistoryList = Get.find<CartController>()
    .getCartHistoryList().reversed.toList();

   Map<String, int>cartItemsPerOrder = Map();
  
  for(int i=0; i<getCartHistoryList.length; i++){
    if(cartItemsPerOrder.containsKey(getCartHistoryList[i].time)){
      cartItemsPerOrder.update(getCartHistoryList[i].time!,(value)=>++value);
    }else{
     cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!,()=>1); 
    }
    }
  
  List<int>cartItemsPerOrderToList(){
    return cartItemsPerOrder.entries.map((e)=>e.value).toList();
  }
  

    // ignore: unused_element
    List<String>cartOrderTimeToList(){
    return cartItemsPerOrder.entries.map((e)=>e.key).toList();
  }
  
  List<int>itemsPerOrder = cartItemsPerOrderToList();
  
  
  var listCounter = 0;


   Widget timeWidget(int index){
    var outputDate = DateTime.now().toString();
   if (index<getCartHistoryList.length) {
      DateTime parseDate=  DateFormat("yyyy-MM-dd HH:mm:ss").parse(getCartHistoryList[listCounter].time!);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat= DateFormat("MM/dd/yyyy hh:mm a");
     outputDate = outputFormat.format(inputDate);
   }
    return BigText(
    title: outputDate
    );
    }

    return Scaffold(
      body: Column(
        children: [
          //appbar section
          Container(
            height: Dimensions.height10*10,
            color: AppColor.mainColor,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: Dimensions.height45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(
                title: "Cart History",
                color: Colors.white,
                ),
                AppIcon(
                icon: Icons.shopping_cart_outlined,
                iconColor: AppColor.mainColor,
                backgroundColor: AppColor.yellowColor,
                ),
              ],
            ),
          ),
          //body section
          GetBuilder<CartController>(
            builder: (_cartController) {  
            return _cartController.getCartHistoryList().length>0? Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  top: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                ),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView(
                    children: [
                      for(int i=0; i<itemsPerOrder.length; i++)
                      Container(
                        height: Dimensions.height30*4,
                        margin: EdgeInsets.only(bottom: Dimensions.height20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           timeWidget(listCounter),
                            SizedBox(height: Dimensions.height10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Wrap(
                                  direction: Axis.horizontal,
                                  children:List.generate(itemsPerOrder[i], (index) {
                                    if (listCounter<getCartHistoryList.length) {
                                      listCounter++;
                                      
                                    }
                                    return index<=2? Container(
                                     height: Dimensions.height20*4,
                                     width: Dimensions.width20*3,
                                     margin: EdgeInsets.only(right: Dimensions.width10/2),
                                     decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(Dimensions.radius15/2),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                      image: NetworkImage(
                                        AppConstants.BASE_URL+AppConstants.UPLOAD_URl+getCartHistoryList[listCounter-1].img!,
                                      )
                                      ),
                                     ),
                                    ):Container();
                                  }
                                  ),
                                ),
                                
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SmallText(
                                      title: "Total",
                                      color: AppColor.titleColor,
                                      ),
                                      BigText(
                                      title: itemsPerOrder[i].toString()+" Items",
                                      color: AppColor.titleColor,
                                      ),
                                      GestureDetector(
                                        onTap: (){
                                          var orderTime = cartOrderTimeToList();
                                          Map<int, CartModel> moreOrder = {};
                                          for (int j = 0; j < getCartHistoryList.length; j++) {
                                            if (getCartHistoryList[j].time==orderTime[i]) {
                                              moreOrder.putIfAbsent(getCartHistoryList[j].id!, () => 
                                              CartModel.fromJson(jsonDecode(jsonEncode(getCartHistoryList[j])))
                                              );
                                            }
                                          }
                                          Get.find<CartController>().setItems = moreOrder;
                                          Get.find<CartController>().addToCartList();
                                          Get.toNamed(RouteHelper.getCartPage());
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                          horizontal: Dimensions.width10,
                                          vertical: Dimensions.height10/2
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(Dimensions.radius15/3),
                                            border: Border.all(width: 1,color: AppColor.mainColor)
                                          ),
                                          child: SmallText(
                                          title: "One more",
                                          color: AppColor.mainColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
          
          
          
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ):NoDataPage(
            text: "You didn't buy anything so far !",
            imgPath:"assets/images/history_cart.jpg" ,
            );
            }
          ),

        ],
      ),
    );
  }
}