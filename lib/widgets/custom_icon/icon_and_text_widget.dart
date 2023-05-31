
import 'package:flutter/material.dart';

import '../../utils/dimensions/dimensions.dart';



class IconAndTextWidget extends StatelessWidget {
  const IconAndTextWidget({
    Key? key,
    required this.onTap,
    required this.icon,
    this.bacgroundColor =const Color(0xfffcf4e4),
    this.iconColor = const Color(0xff756d54),
    this.size=40,
    this.iconSize=16
    }) : super(key: key);
    final IconData icon;
    final Color bacgroundColor;
    final Color iconColor;
    final double size;
    final double iconSize;
    final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius20,),
        color: bacgroundColor
      ),
      child: InkWell(
        onTap: onTap,
        child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
        
        ),
      ),
    );
  }
}