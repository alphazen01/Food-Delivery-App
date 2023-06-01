import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


import 'package:get/get.dart';


import '../../base/custom_loader.dart';
import '../../base/show_custom_snackbar.dart';
import '../../controller/auth_controller.dart';
import '../../models/sign_up_body_model.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_color/app_colors.dart';
import '../../utils/dimensions/dimensions.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/custom_texts/big_text.dart';

class SignUpPage extends StatelessWidget {
  const 
  SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phonelController = TextEditingController();

    var signUpImages = [
    "assets/images/twitter.png",
    "assets/images/facebook.png",
    "assets/images/google.png",
   
    ];
     void _registration(AuthController authController){
      var authController = Get.find<AuthController>();
      String name = nameController.text.trim();
      String phone = phonelController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();


      if (name.isEmpty) {
        showCustomSanckBar("Type in your name",title: "Name");
      } else if(phone.isEmpty) {
        showCustomSanckBar("Type in your phone number",title: "Phone number");
      } else if(email.isEmpty){
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
        
        
        SignUpBody signUpBody =SignUpBody(
          name: name, 
          phone: phone, 
          email: email, 
          password: password
          );
          
          print(signUpBody.toString());
         authController.registration(signUpBody).then((status){
         if (status.isSuccess) {
          showCustomSanckBar("All went well",title: "Perfect");
          print("Success registration");
          Get.toNamed(RouteHelper.getCartPage());
         } else {
           showCustomSanckBar(status.message);
           print("object");
         }

         });
      }
    }

   

    return Scaffold(
      body: GetBuilder<AuthController>(
        builder: (_authController) { 
        return !_authController.isLoading?
         SingleChildScrollView(
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
              SizedBox(height: Dimensions.height10,),
             Column(
              children: [
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
              //name
              AppTextField(
                obscureText: false,
              textEditingController: nameController, 
              hintText: "Name", 
              icon: Icons.person
              ),
              SizedBox(height: Dimensions.height20,),
              //phone
              AppTextField(
                obscureText: false,
              textEditingController: phonelController, 
              hintText: "Phone", 
              icon: Icons.phone
              ),
              SizedBox(height: Dimensions.height20,),
              //signup button
              GestureDetector(
                onTap: (){
                  _registration(_authController);
                  // Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));
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
                    title:"Sign Up",
                    fontSize: Dimensions.font20+Dimensions.font20/2,
                    color: Colors.white, 
                    ),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.height10,),
              //tagline
              RichText(
              text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                text: "Have an account already?",
                style: TextStyle(
                  color:Colors.grey[500],
                  fontSize: Dimensions.font20
                )
              ),
              ),
              SizedBox(height: Dimensions.screenHeight*0.05,),
        
              //sign up option
               RichText(
              text: TextSpan(
                
                text: "Sign up using one of the following methods",
                style: TextStyle(
                  color:Colors.grey[500],
                  fontSize: Dimensions.font16
                )
              ),
              ),
        
              Wrap(
                children: List.generate(3, (index) => Padding(
                  padding: EdgeInsets.all(8),
                  child: CircleAvatar(
                    radius: Dimensions.radius30,
                    backgroundImage: AssetImage(
                     signUpImages[index]
                    ),
                  ),
                )
                ),
              ),
        
              ],
             ),
            ],
          ),
         )
         :CustomLoader();

        }
      ),
    );

   

  }
  
}