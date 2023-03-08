
import 'package:flutter/material.dart';
import 'package:food/check/controller/product_controller.dart';
import 'package:food/check/page/loading.dart';
import 'package:provider/provider.dart';
import '../../utils/app_color/app_colors.dart';
import '../../utils/dimensions/dimensions.dart';
import '../../widgets/custom_texts/big_text.dart';
import '../../widgets/custom_texts/icon_text_widget.dart';
import '../../widgets/custom_texts/small_text.dart';

class CheckHome extends StatefulWidget {
  CheckHome({Key? key}) : super(key: key);

  @override
  State<CheckHome> createState() => _CheckHomeState();
}

class _CheckHomeState extends State<CheckHome> {
   PageController pageController = PageController(viewportFraction: 0.85);

  // ignore: unused_field
  var _currentPageValue =0.0;

  // ignore: unused_field
  double _scaleFactor =0.8;

  // ignore: unused_field
  double _height =Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
      super.initState();
    final data = Provider.of<CheckProductsController>(context, listen: false);
    WidgetsBinding.instance
        .addPostFrameCallback((_) => data.productsData(context));
  }
  
  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    throw UnimplementedError();
  }
  }

  // @override
  // void initState() {
  
  //   super.initState();
  //   pageController.addListener(() {
  //   setState(() {
  //     _currentPageValue=  pageController.page!;
  //   });

  //   });
    
  // }
  

  // @override
  // void dispose() {
  //   super.dispose();
  //   pageController.dispose();
  // }
    Loading load = Loading();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // GetBuilder<ProductController>(
        // builder: (productController){
        //   return Container(
        //   height: Dimensions.pageView,
        //   child: PageView.builder(
        //  controller: pageController,
        //   itemCount: productController.productList.length,
        //   itemBuilder: ((context, position) {
        //     return _builPageItem(position,productController.productList[position]);
        //   })
        //   ),
        // );
        // }
        // ),

      Consumer<CheckProductsController>(
        builder: (context, checkProductsController, child) {
          if (checkProductsController.checkProductDataState == DataState.loading) {
            return load.loader();
          } else if (checkProductsController.checkProductDataState == DataState.loaded) {
            return ListView.builder(
              itemCount: checkProductsController.checkProductModel.products!.length,
              itemBuilder: ((context, index) {
                return Center(
                  child: Column(
                    children: [
                      Text(checkProductsController.checkProductModel.products![index].price.toString()),
                     // Image.network(checkProductsController.checkProductModel.products![index].img!,scale: 10)
                      // Text(productsList.products?[index].rating.toString()??"")
                    ],
                  ),
                );
              }),
            );
          } else {
            return Text('Something else');
          }
        },
      ),
    


      //    DotsIndicator(
      //       dotsCount:productController.productList.isEmpty?1:productController.productList.length,
      //       position: _currentPageValue,
      //       decorator: DotsDecorator(
      //         activeColor: AppColor.mainColor,
      //     size: const Size.square(9.0),
      //     activeSize: const Size(18.0, 9.0),
      //     activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      //   ),
      // );
       
  SizedBox(height: Dimensions.height30,),
  Container(
    margin: EdgeInsets.only(left: Dimensions.width30),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        BigText(
        title: "Popular"
        ),
        SizedBox(width: Dimensions.width10,),
        Container(
          margin: EdgeInsets.only(bottom: 3),
          child: BigText(title: ".",color: Colors.black26,),
        ),
        SizedBox(width: Dimensions.width10,),
        Container(
          margin: EdgeInsets.only(bottom: 2),
          child: SmallText(title: "Food pairing"),
        ),
      ],
    ),
  ),

  ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
  itemCount: 10,
  itemBuilder: (context,index){
  return Container(
    margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20,bottom: Dimensions.height10),
    child: Row(
      children: [
        Container(
          width: Dimensions.listViewImgSize,
          height: Dimensions.listViewImgSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimensions.radius20),
            color: Colors.white38,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/images/rolex.png"
              )
              )
          ),
        ),
        Expanded(
          child: Container(
            height: Dimensions.listViewTextContainerSize,
            decoration:BoxDecoration(
              borderRadius:BorderRadius.circular(Dimensions.height10),
              color:Colors.white
            ),
            child: Padding(
              padding: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BigText(
                  title: "Nutritious fruit meal in China"
                  ),
                  SmallText(
                  title: "With chinese characteristics"
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconTextWidget(
                      icon: Icons.circle_sharp, 
                      title: "Normal", 
                      iconColor: AppColor.iconColor1
                      ),
                      IconTextWidget(
                      icon: Icons.location_on, 
                      title: "1.7km", 
                      iconColor: AppColor.mainColor
                      ),
                      IconTextWidget(
                      icon: Icons.access_time_rounded, 
                      title: "32min", 
                      iconColor: AppColor.iconColor2
                      ),
                      
                    ],
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
  ),


      ],
    );
  }

//   Widget _builPageItem(int index,CheckProductModel checkProductList,){

//   Matrix4 matrix = Matrix4.identity();
//   if (index==_currentPageValue.floor()) {
//     var currScale =1 -(_currentPageValue-index)*(1-_scaleFactor);
//     var currTrans = _height*(1-currScale)/2;
//     matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    
//   } else if(index== _currentPageValue.floor()+1) {
//     var currScale = _scaleFactor+(_currentPageValue-index+1)*(1-_scaleFactor);
//     var currTrans = _height*(1-currScale)/2;
//     matrix = Matrix4.diagonal3Values(1, currScale, 1);
//     matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

//   } else if(index== _currentPageValue.floor()-1) {
//     var currScale =1 -(_currentPageValue-index)*(1-_scaleFactor);
//     var currTrans = _height*(1-currScale)/2;
//     matrix = Matrix4.diagonal3Values(1, currScale, 1);
//     matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);

//   }else{
//     var currScale = 0.8;
//     matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);;

//   }

//     return Transform(
//       transform: matrix,
//       child: Stack(
//         children: [
        
//           Container(
//             height: Dimensions.pageViewContainer,
//             margin: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(Dimensions.radius30),
//               color:index.isEven? Color(0xff69c5df):Color(0xff9294cc),
//               image: DecorationImage(
//               image: AssetImage(
              
//               ""
//               )
//               )
//             ),
//           ),
//            Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//             height: Dimensions.pageViewTextContainer,
//             margin: EdgeInsets.only(left: Dimensions.width30,right: Dimensions.width30,bottom: Dimensions.height30),
//             decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(Dimensions.radius20),
//             color:Colors.white,
//             boxShadow:[
//               BoxShadow(
//                 color: Color(0xffe8e8e8),
//                 blurRadius: 5.0,
//                 offset: Offset(0, 5)
//               ),
//               BoxShadow(
//                 color: Colors.white,
//                 offset: Offset(-5, 0)
//               ),
//               BoxShadow(
//                 color: Colors.white,
//                 offset: Offset(5, 0)
//               ),
//             ] 
//               ),
//               child: Container(
//                 padding: EdgeInsets.only(top: 15,left: 15,right: 15),
//                 child: AppColumn(
//                   title: "Chiness Side",
//                 )
//               ),
//             ),
//           ),


//         ],
//       ),
//     );
//   }
// }