import 'package:food_app/data/repository/user_repo.dart';
import 'package:food_app/models/user_model.dart';
import 'package:get/get.dart';

import '../data/repository/auth_repo.dart';
import '../models/respons_model.dart';

class UserController extends GetxController implements GetxService{

late final UserRepo userRepo;

UserController({
  required this.userRepo
});

bool _isLoading = false;
late UserModel _userModel;

bool get isLoading => _isLoading;
UserModel get userModel =>_userModel;

Future<ResponseModel>  getUserInfo()async{

 Response response = await userRepo.getUserInfo();
 late ResponseModel responseModel;
 if (response.statusCode==200) {
  _userModel = UserModel.fromjson(response.body);
  _isLoading = true;
   responseModel = ResponseModel(true,"successfully");
 } else {
    responseModel = ResponseModel(false, response.statusText!);
 }

 return responseModel;
}



}