

class LoginModel{

String email;
String password;
String phone;

LoginModel({
  required this.email,
  required this.password,
  required this.phone,
});


Map<String, dynamic>toJson(){
  final Map<String,dynamic>data = Map<String,dynamic>();

  data["email"] = this.email;
  data["password"] = this.password;
  data["phone"] = this.phone;
  return data;
}






}
