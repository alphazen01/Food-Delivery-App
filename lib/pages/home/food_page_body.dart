import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controller/popular_product_controller.dart.dart';
import '../../controller/recommended_controller.dart';
import '../../models/popular_products_model.dart.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_color/app_colors.dart';
import '../../utils/constants/app_constants.dart';
import '../../utils/dimensions/dimensions.dart';
import '../../widgets/app_column.dart';
import '../../widgets/custom_texts/big_text.dart';
import '../../widgets/custom_texts/icon_text_widget.dart';
import '../../widgets/custom_texts/small_text.dart';

class FoodPageBody extends StatefulWidget {
 
   FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
   PageController pageController = PageController(viewportFraction: 0.85);
   var _currPageValue=0.0;
   double _scaleFactor =0.8;
   double _height =Dimensions.pageViewContainer;
   @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue= pageController.page!;
        print("current value is"+_currPageValue.toString());
      });
    });
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //sliderSection
        GetBuilder<PopularProductController>(
          builder: (popularProducts) {
           return popularProducts.isLoaded? Container(
            height: Dimensions.pageView,
            child:PageView.builder(
              controller: pageController,
            itemCount: popularProducts.popularProductList.length,
            itemBuilder: (context,position){
              return _buildPageItem(position,popularProducts.popularProductList[position]);
            }
            )
          ):CircularProgressIndicator(
            color: AppColor.mainColor,
          );
          },
          
        ),
        //dotsIndicator
        GetBuilder<PopularProductController>(
          builder: (popularProducts) {
            return  DotsIndicator(
          dotsCount: popularProducts.popularProductList.isEmpty?1:popularProducts.popularProductList.length,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColor.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
              );
          },
        ),
       //popularText
       SizedBox(height: Dimensions.height30,),
       Container(
        margin: EdgeInsets.only(left: Dimensions.width30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children:[
            BigText(
            title: "Recommended"
            ),
            SizedBox(width: Dimensions.width10,),
             Container(
              margin: EdgeInsets.only(bottom: 3),
              child: BigText(
            title: ".",color: Colors.black26,
            ),
             ),
            SizedBox(width: Dimensions.width10,),
            Container(
              margin: EdgeInsets.only(bottom: 2),
              child: SmallText(
              title: "Food pairing"
              ),
            ),
          ]
        ),
       ),
       //list of food and image
       //recommendedFood
      GetBuilder<RecommendedProductController>(
      builder: ((recommendedProduct) {
        return recommendedProduct.isLoaded?
        ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: recommendedProduct.recommendedProductList.length,
        itemBuilder: (context, index) {
          
          return GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getRecommendedFood(index,"home"));
            },
            child: Container(
              margin: EdgeInsets.only(
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: Dimensions.height10
              ),
              child: Row(
                children:[
                  //image section
                  Container(
                    height: Dimensions.listViewImgSize,
                    width: Dimensions.listViewImgSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                      image:NetworkImage(AppConstants.BASE_URL+"/uploads/"+ recommendedProduct.recommendedProductList[index].img!),
                      )
                    ),
                  ),
                  //textContainerSection
                  Expanded(
                    child: Container(
                      height: Dimensions.listViewTextContainerSize,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius20),
                          bottomRight: Radius.circular(Dimensions.radius20),
                          ),
                        color: Colors.white
                      ),
                      
                      child: Padding(
                        padding: EdgeInsets.only(left: Dimensions.width10,
                        // right: Dimensions.width10
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:[
                          BigText(
                          title: recommendedProduct.recommendedProductList[index].name!
                          ),
                          // SizedBox(height: Dimensions.height10,),
                          SmallText(
                          title: "With chinese characteristics"
                          ),
                          // SizedBox(height: Dimensions.height10,),
                          Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconTextWidget(
                          icon: Icons.circle_sharp,
                          title: "Normal", 
                          iconColor: AppColor.iconColor1,
                          
                        ),
                        IconTextWidget(
                          icon: Icons.location_on, 
                          title: "1.8km", 
                          iconColor: AppColor.mainColor
                        ),
                        IconTextWidget(
                          icon: Icons.access_time_rounded, 
                          title: "32min", 
                          iconColor: AppColor.iconColor2
                        ),
                      ],
                    ),
                          ]
                        ),
                      ),
                    ),
                  )
                ]
              ),
            ),
          );
        }
        ):CircularProgressIndicator(
          color: AppColor.mainColor,
        );
      })
      )
      ],
    );
  }
  Widget _buildPageItem(int index,ProductModel popularProduct){
    Matrix4 matrix = Matrix4.identity();
    if(index==_currPageValue.floor()){
      var currScale =1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans=_height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if(index ==_currPageValue.floor()+1){
      var currScale = _scaleFactor+(_currPageValue-index)*(1-_scaleFactor);
      var currTrans=_height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else if(index ==_currPageValue.floor()-1){
      var currScale =1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans=_height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }
    else{
      var currScale=0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);

    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: (){
               Get.toNamed(RouteHelper.getPopularFood(index,"home"));
              },
            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color:index.isEven? Color(0xff69c5df):Color(0xff9294cc),
                image: DecorationImage(
                  image: NetworkImage(AppConstants.BASE_URL+AppConstants.UPLOAD_URl+ popularProduct.img!),
                  fit: BoxFit.cover
                  ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
              left: Dimensions.width30,
              right: Dimensions.width30,
              bottom: Dimensions.height30
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color:Colors.white,
                boxShadow:[
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    offset: Offset(0, 5)
                  ),
                   BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0)
                  ),
                   BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0)
                  ),
                ]
              ),
              child: Container(
                padding: EdgeInsets.only(
                top: Dimensions.height15,
                left: Dimensions.width15,
                // right: Dimensions.width15
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(
                    title: popularProduct.name!
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}