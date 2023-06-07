import 'package:flutter/material.dart';
import 'package:food_app/base/custom_loader.dart';
import 'package:food_app/controller/auth_controller.dart';
import 'package:food_app/controller/cart_controller.dart';
import 'package:food_app/controller/user_controller.dart';
import 'package:food_app/routes/route_helper.dart';
import 'package:get/get.dart';

import '../pages/auth/sign_in.dart';
import '../utils/app_color/app_colors.dart';
import '../utils/app_icon/app_icon.dart';
import '../utils/dimensions/dimensions.dart';
import '../widgets/account_widget.dart';
import '../widgets/custom_texts/big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
      print("User has logged In");
      
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.mainColor,
        title:BigText(
        title: "Profile",
        fontSize: 24,
        )
      ),
      body:
      GetBuilder<UserController>(
        builder: (usrController) {
          return _userLoggedIn?(usrController.isLoading? Container(
          width: double.maxFinite,
          margin: EdgeInsets.only(top: Dimensions.height20),
          child: Column(
            children: [
              //profile icon
              AppIcon(
              icon: Icons.person,
              backgroundColor: AppColor.mainColor,
              iconColor: Colors.white,
              iconSize: Dimensions.height15*5,
              size: Dimensions.height15*10,
              ),
              SizedBox(height: Dimensions.height30,),
      
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //name
                AccountWidget(
                appIcon: AppIcon(
                icon: Icons.person,
                backgroundColor: AppColor.mainColor,
                iconColor: Colors.white,
                iconSize: Dimensions.height10*5/2,
                size: Dimensions.height10*5,
                ), 
                bigText: BigText(
                title: usrController.userModel.name
                )
                ),
                SizedBox(height: Dimensions.height20,),
              
                //phone
                AccountWidget(
                appIcon: AppIcon(
                icon: Icons.phone,
                backgroundColor: AppColor.yellowColor,
                iconColor: Colors.white,
                iconSize: Dimensions.height10*5/2,
                size: Dimensions.height10*5,
                ), 
                bigText: BigText(
                title:usrController.userModel.phone
                )
                ),
                SizedBox(height: Dimensions.height20,),
              
                //email
                AccountWidget(
                appIcon: AppIcon(
                icon: Icons.email,
                backgroundColor: AppColor.yellowColor,
                iconColor: Colors.white,
                iconSize: Dimensions.height10*5/2,
                size: Dimensions.height10*5,
                ), 
                bigText: BigText(
                title: usrController.userModel.email
                )
                ),
                SizedBox(height: Dimensions.height20,),
                //address
                AccountWidget(
                appIcon: AppIcon(
                icon: Icons.location_on,
                backgroundColor: AppColor.yellowColor,
                iconColor: Colors.white,
                iconSize: Dimensions.height10*5/2,
                size: Dimensions.height10*5,
                ), 
                bigText: BigText(
                title: "Fill your address"
                )
                ),
                SizedBox(height: Dimensions.height20,),
                //message
                AccountWidget(
                appIcon: AppIcon(
                icon: Icons.message,
                backgroundColor: Colors.redAccent,
                iconColor: Colors.white,
                iconSize: Dimensions.height10*5/2,
                size: Dimensions.height10*5,
                ), 
                bigText: BigText(
                title: "message"
                )
                ),
                SizedBox(height: Dimensions.height20,),
              
                //logout
                GestureDetector(
                  onTap: (){
                    if (Get.find<AuthController>().userLoggedIn()) {
                      Get.find<AuthController>().clearShareData();
                      Get.find<CartController>().clear();
                      Get.find<CartController>().clearCartHistory();
                      Get.offNamed(RouteHelper.getSignInPage());
                    } 
                    
                  },
                  child: AccountWidget(
                  appIcon: AppIcon(
                  icon: Icons.logout,
                  backgroundColor: Colors.redAccent,
                  iconColor: Colors.white,
                  iconSize: Dimensions.height10*5/2,
                  size: Dimensions.height10*5,
                  ), 
                  bigText: BigText(
                  title: "LogOut"
                  )
                  ),
                ),
                    ],
                  ),
                ),
              ),
              
            ],
          ),
        ):CustomLoader()):
        Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.maxFinite,
            
            height: Dimensions.height20*10,
            decoration: BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage("assets/images/bicycle.jpg"),
                  fit: BoxFit.cover
                  ),
                  
                ),
               
          ),
          GestureDetector(
            onTap: (){
              Get.toNamed(RouteHelper.getSignInPage());
            },
            child: Container(
              width: double.maxFinite,
              height: Dimensions.height20*5,
              margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
              decoration: BoxDecoration(
                color: AppColor.mainColor,
                borderRadius: BorderRadius.circular(Dimensions.radius20)
              ),
              child: Center(
              child: BigText(
              title: "Sign In First",
              fontSize: 24,
              color: Colors.white,
              )
                ),
            ),
          )
        ],
      );
        },
         
      ),
    );
  }
}