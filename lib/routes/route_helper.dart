

import 'package:food_app/pages/auth/sign_in.dart';
import 'package:get/get.dart';

import '../pages/cart/cart_page.dart';
import '../pages/food/popular_food_details.dart';
import '../pages/food/recommended_food_details.dart';
import '../pages/home/home_page.dart';
import '../pages/splash/splash_screen.dart';

class RouteHelper{
  static const String initial ="/";
  static const String popularFood ="/popular-food";
  static const String recommendedFood ="/recommended-food";
  static const String cartPage ="/cart-page";
  static const String signIn ="/sign-in";
  static const String splashScreen ="/Splash-Screen";
 


  static String getInitial()=>"$initial";
  static String getPopularFood(int pageId, String page)=>"$popularFood?pageId=$pageId&page=$page";
  static String getRecommendedFood(int pageId, String page)=>"$recommendedFood?pageId=$pageId&page=$page";
  static String getCartPage()=>"$cartPage";
  static String getSignInPage()=>"$signIn";
  static String getSplashScreen()=>"$splashScreen";



  static List<GetPage>routes =[
    GetPage(name: splashScreen, page: ()=>SplashScreen(),),
    GetPage(name: initial, page: ()=>HomePage(),),

    GetPage(name: signIn, page: (){
      return SignInPage();},
      transition: Transition.fade
      ),

    GetPage(name:popularFood, page: (){
      var pageId = Get.parameters["pageId"];
      var page = Get.parameters["page"];
      return PopularFoodDetails(pageId:int.parse(pageId!),page: page!,);
    },
    transition: Transition.fadeIn
    ),
    GetPage(name:recommendedFood, page: (){
      var pageId = Get.parameters["pageId"];
      var page = Get.parameters["page"];
      return RecommendedFoodDetails(pageId:int.parse(pageId!),page: page!,);
    },
    transition: Transition.fadeIn
    ),
     GetPage(name:cartPage, page: (){
      return CartPage();
    },
    transition: Transition.fadeIn
    ),
  
     
  ];
}