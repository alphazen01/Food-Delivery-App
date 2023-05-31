import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final double iconSize;
   AppIcon({
    Key? key,
    required this.icon,
    this.iconColor=const Color(0xff756d54),
    this.backgroundColor=const Color(0xfffcf4ef),
    this.size=40,
    this.iconSize=16
    }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroundColor
      ),
      child: Icon(
      icon,
      color: iconColor,
      size: iconSize,
      ),
    );
  }
}