
import 'package:food_app/data/api/api_client.dart';
import 'package:food_app/models/login_model.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/sign_up_body_model.dart';
import '../../utils/constants/app_constants.dart';

class AuthRepo{

final ApiClient apiClient;
final SharedPreferences sharedPreferences;

AuthRepo({
  required this.apiClient,
  required this.sharedPreferences
});

Future<Response> registration(SignUpBody signUpBody)async{
  return await apiClient.postData(AppConstants.REGISTRATION_URI, signUpBody.toJson());
}

bool userLoggedIn(){
  return  sharedPreferences.containsKey(AppConstants.TOKEN,);
}

Future<String> getUserToken()async{
  return await sharedPreferences.getString(AppConstants.TOKEN)??"None";
}

Future<Response> login(LoginModel loginModel)async{
  return await apiClient.postData(AppConstants.LOGIN_URI,loginModel.toJson());
}

Future<bool>  saveUserToken(String token)async{
  apiClient.token = token;
  apiClient.updateHeader(token);
  return await sharedPreferences.setString(AppConstants.TOKEN, token);
}

Future<void> saveUserNumberAndPassword(String number, String password)async{
  try {
    await sharedPreferences.setString(AppConstants.PHONE, number);
    await sharedPreferences.setString(AppConstants.PASSWORD, password);
  } catch (e) {
    
  }
}

bool clearShareData(){
  sharedPreferences.remove(AppConstants.TOKEN);
  sharedPreferences.remove(AppConstants.PASSWORD);
  sharedPreferences.remove(AppConstants.PHONE);
  apiClient.token ="";
  apiClient.updateHeader("");
  return true;
}

}