import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food/check/models/product_model.dart';

import 'package:http/http.dart' as http;

enum DataState{initital,loading,loaded,empty,error}

class CheckProductsController extends ChangeNotifier {
  DataState checkProductDataState=DataState.initital;
 
CheckProductModel checkProductModel = CheckProductModel();

  Future<CheckProductModel> productsData(context) async {
    checkProductDataState=DataState.loading;
    notifyListeners();
    try {
      final response = await http.get(Uri.parse(
          "https://mvs.bslmeiyu.com/api/v1/products/popular"));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        checkProductModel = CheckProductModel.fromJson(data);
        print(checkProductModel.typeId);
        checkProductDataState=DataState.loaded;
      } else {
        checkProductDataState=DataState.error;
        print("Something went wrong");
      }
    } catch (e) {
      print(e.toString());
    }
 notifyListeners();
    return checkProductModel;
  
  }
}