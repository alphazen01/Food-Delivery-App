
import 'package:flutter/cupertino.dart';

import '../../utils/dimensions/dimensions.dart';


// ignore: must_be_immutable
class BigText extends StatelessWidget {
   BigText({
    Key? key,
  required this.title,
  this.color=const Color(0xff332d2b),
  this.overflow=TextOverflow.ellipsis,
  this.fontSize=0
    }) : super(key: key);
   Color? color;
  final String title;
  double fontSize=0;
  TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontSize:fontSize==0?Dimensions.font20:fontSize ,
        color:color,
        fontWeight: FontWeight.w400,
        fontFamily: "Roboto"
      ),
    );
  }
}