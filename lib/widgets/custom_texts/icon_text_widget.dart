


import 'package:flutter/material.dart';

import '../../utils/dimensions/dimensions.dart';



// ignore: must_be_immutable
class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  Color? textColor;
  double fontSize;
  final double iconSize;

  final Color iconColor;
   IconTextWidget({
    Key? key,
    required this.icon,
    required this.title,
    this.fontSize=12,
    this.iconSize=16,
    this.textColor=Colors.black45,
    required this.iconColor,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: iconColor,size: Dimensions.iconSize24,),
        SizedBox(width: 5,),
       Text(
      title,

      style: TextStyle(
        fontSize:fontSize ,
        color:textColor,
        fontWeight: FontWeight.w400,
        fontFamily: "Roboto"
      ),
    )
      ],
    );
  }
}