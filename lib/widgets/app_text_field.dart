import 'package:flutter/material.dart';


import '../utils/app_color/app_colors.dart';
import '../utils/dimensions/dimensions.dart';

// ignore: must_be_immutable
class AppTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final IconData icon;
  bool obscureText =false;
   AppTextField({Key? key,
   required this.textEditingController,
   required this.hintText,
   required this.icon,
   required this.obscureText,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.only(
              left: Dimensions.height20,
              right: Dimensions.height20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  spreadRadius: 1,
                  offset: Offset(1, 1),
                  color: Colors.grey.withOpacity(0.2)
                )
              ]
            ),
            child: TextField(
              obscureText: obscureText,
              keyboardType: TextInputType.emailAddress,
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: Icon(icon,color: AppColor.yellowColor,),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.white
                  )
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Colors.white
                  )
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(Dimensions.radius15),
                  borderSide: BorderSide(
                    width: 3.0,
                    color: Colors.red
                  )
                )
              ),
            ),
          );
  }
}