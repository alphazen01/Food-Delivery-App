

import 'package:food_app/models/login_model.dart';
import 'package:food_app/models/respons_model.dart';
import 'package:food_app/pages/cart/cart_page.dart';
import 'package:get/get.dart';

import '../data/repository/auth_repo.dart';
import '../models/sign_up_body_model.dart';

class AuthController extends GetxController implements GetxService{

final AuthRepo authRepo;

AuthController({
  required this.authRepo
});

bool _isLoading = false;

bool get isLoading => _isLoading;

Future<ResponseModel>  registration(SignUpBody signUpBody)async{
  _isLoading = true;
  update();
 Response response = await authRepo.registration(signUpBody);
 late ResponseModel responseModel;
 if (response.statusCode==200) {
   authRepo.saveUserToken(response.body["token"]);
   responseModel = ResponseModel(true, response.body["token"]);
 } else {
    responseModel = ResponseModel(false, response.statusText!);
 }
 _isLoading = false;
 update();
 return responseModel;
}

Future<ResponseModel>  login(LoginModel loginModel)async{
  _isLoading = true;
  update();
 Response response = await authRepo.login(loginModel);
 print("yyyyyy");
print(response.statusCode);
print(response.body);
 
 late ResponseModel responseModel;
 if (response.statusCode==200) {
  print("Backend token");
   authRepo.saveUserToken(response.body["token"]);
    print(response.body["token"].toString());
   responseModel = ResponseModel(true, response.body["token"]);
 } else {
    responseModel = ResponseModel(false, response.statusText!);
 }
 _isLoading = false;
 update();
 return responseModel;
}








void saveUserNumberAndPassword(String number,String password){
authRepo.saveUserNumberAndPassword(number, password);
  
}

bool userLoggedIn(){
  return  authRepo.userLoggedIn();
}

bool clearShareData(){
  return authRepo.clearShareData();
}

}