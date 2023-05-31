
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:food_app/widgets/custom_texts/big_text.dart';

import '../utils/app_icon/app_icon.dart';
import '../utils/dimensions/dimensions.dart';


class AccountWidget extends StatelessWidget {
  AppIcon appIcon;
  BigText bigText;
   AccountWidget({Key? key,
  required this.appIcon,
  required this.bigText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
      left:Dimensions.width20,
      top: Dimensions.width10, 
      bottom: Dimensions.width10, 
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow:[
          BoxShadow(
            blurRadius: 1,
            offset: Offset(0, 2),
            color: Colors.grey.withOpacity(0.2)
          )
        ]
      ),
      child: Row(
        children: [
          appIcon,
          SizedBox(width: Dimensions.width20,),
          bigText
        ],
      ),
    );
  }
}