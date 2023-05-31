import 'package:flutter/material.dart';

import '../utils/app_color/app_colors.dart';
import '../utils/dimensions/dimensions.dart';
import 'custom_texts/big_text.dart';
import 'custom_texts/icon_text_widget.dart';
import 'custom_texts/small_text.dart';

class AppColumn extends StatelessWidget {
  const AppColumn({
    Key? key,
    required this.title
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(
          title: title,
          fontSize: Dimensions.font26,
          ),
          SizedBox(height: Dimensions.height10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Wrap(
                children: List.generate(5, (index) => Icon(
                  Icons.star,color: AppColor.mainColor,
                  size: 15,
                  )
                  ),
              ),
              // SizedBox(width: Dimensions.width10,),
              SmallText(
              title: "4.5"
              ),
              // SizedBox(width: Dimensions.width10,),
              SmallText(
              title: "1287"
              ),
              // SizedBox(width:Dimensions.width10,),
              SmallText(
              title: "comments"
              )
            ],
          ),
          SizedBox(height: Dimensions.height10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
      );
  }
}