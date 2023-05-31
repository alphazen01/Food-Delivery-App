
import 'package:flutter/material.dart';

import '../utils/app_color/app_colors.dart';
import '../utils/dimensions/dimensions.dart';


class CustomLoader extends StatelessWidget {
  const CustomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: Dimensions.height20*5,
        width: Dimensions.height20*5,
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(Dimensions.height20*5/2),
          color: AppColor.mainColor

        ),
        alignment: Alignment.center,
        child: CircularProgressIndicator(color: Colors.white,),
      ),
    );
  }
}