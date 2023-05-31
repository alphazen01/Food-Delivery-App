
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../widgets/custom_texts/big_text.dart';

void showCustomSanckBar(String message, {bool isError=true,String title="Error"}){
  
Get.snackbar(
title, message,
titleText: BigText(title: title,color: Colors.white,),
messageText: Text(message,style: TextStyle(
  color: Colors.white
),
),
colorText: Colors.white,
snackPosition: SnackPosition.TOP,
backgroundColor: Colors.redAccent

);

}