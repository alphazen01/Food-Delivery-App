


import 'package:flutter/material.dart';


// ignore: must_be_immutable
class SmallText extends StatelessWidget {
   SmallText({
    Key? key,
  required this.title,
  this.color=Colors.black45,
  // const Color(0xffccc7c5)

  this.fontSize=16,
  this.height=1.2
    }) : super(key: key);
   Color? color;
  final String title;
  double fontSize;
  double height;


  @override
  Widget build(BuildContext context) {
    return Text(
      title,

      style: TextStyle(
        fontSize:fontSize ,
        color:color,
        fontWeight: FontWeight.w400,
        fontFamily: "Roboto"
      ),
    );
  }
}