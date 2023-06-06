
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/login_model.dart';
import 'package:food_app/pages/auth/sign_up.dart';

import 'package:get/get.dart';

import '../../base/custom_loader.dart';
import '../../base/show_custom_snackbar.dart';
import '../../controller/auth_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_color/app_colors.dart';
import '../../utils/dimensions/dimensions.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/custom_texts/big_text.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var phoneController = TextEditingController();
    void _login(AuthController authController){


      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String phone= phoneController.text.trim();


      if(email.isEmpty){
        showCustomSanckBar("Type in your email address",title: "Email address");
      } else if(!GetUtils.isEmail(email)){
        showCustomSanckBar("Type in your valid email address",title: "Valid email address");
      }
       else if(password.isEmpty){
        showCustomSanckBar("Type in your password",title: "Password");
      }else if(password.length<6){
        showCustomSanckBar("Password can not be less than six characters",title: "Password");
      }
      else{
        
         LoginModel loginModel =LoginModel(

          email: email, 
          password: password,
          phone: phone
 
          );
        

         authController.login(loginModel).then((status){
         if (status.isSuccess) {
          showCustomSanckBar("All went well",title: "Perfect");
          print("Success login");
          Get.toNamed(RouteHelper.getInitial());
         } else {
           showCustomSanckBar(status.message);
           print("object");
         }

         });
      }
    }





    return Scaffold(
      body: GetBuilder<AuthController>(
        builder: (authController) {
          return !authController.isLoading? SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
               SizedBox(height: Dimensions.screenHeight*0.05,),
                //image section
          
                Container(
                  height: Dimensions.screenHeight*0.25,
                  child: Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 80,
                      backgroundImage: AssetImage(
                        "assets/images/food_logo.jpg"
                      ),
                    ),
                  ),
                ),
                //Welcome Text
                Container(
                  margin: EdgeInsets.only(left: Dimensions.width20),
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello",
                        style: TextStyle(
                          fontSize: Dimensions.font20*3+Dimensions.font20/2,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                        Text(
                        "Sign into your account",
                        style: TextStyle(
                          fontSize: Dimensions.font20,
                          color: Colors.grey[500]
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: Dimensions.height20,),
                //email
               AppTextField(
                obscureText: false,
              textEditingController: emailController, 
              hintText: "Email", 
              icon: Icons.email
              ),
                SizedBox(height: Dimensions.height20,),
                //password
                AppTextField(
                  obscureText: true,
                textEditingController: passwordController, 
                hintText: "Password", 
                icon: Icons.password_sharp
                ),
                SizedBox(height: Dimensions.height20,),
                AppTextField(
                obscureText: false,
              textEditingController: phoneController, 
              hintText: "Phone", 
              icon: Icons.phone
              ),
                SizedBox(height: Dimensions.height20,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RichText(
                text: TextSpan(
                  
                  text: "Sign into your account",
                  style: TextStyle(
                    color:Colors.grey[500],
                    fontSize: Dimensions.font16
                  )
                ),
                ),
                SizedBox(width: Dimensions.width20,)
                  ],
                 ),
                 SizedBox(height: Dimensions.screenHeight*0.05,),
                 //signIn button
                 GestureDetector(
                  onTap: (){
                    _login(authController);
                  },
                   child: Container(
                    width:Dimensions.screenWidth/2,
                    height: Dimensions.screenHeight/13,
                    decoration: BoxDecoration(
                      color: AppColor.mainColor,
                      borderRadius: BorderRadius.circular(Dimensions.radius30)
                    ),
                    child: Center(
                      child: BigText(
                      title:"Sign In",
                      fontSize: Dimensions.font20+Dimensions.font20/2,
                      color: Colors.white, 
                      ),
                    ),
                      ),
                 ),
                SizedBox(height: Dimensions.screenHeight*0.05,),
             
              RichText(
              text: TextSpan(
                text:"Don't have an account?",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: Dimensions.font20
                ),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage()),
                    text: "Create",
                    style: TextStyle(
                      color: AppColor.mainBlackColor,
                      fontSize: Dimensions.font20,
                      fontWeight: FontWeight.bold
                  )
                  )
                ] 
              )
              ),
                SizedBox(height: Dimensions.screenHeight*0.05,),
            ],
          ),
        ):Center(child: CustomLoader());
        },
    
      ),
    );
  }
}