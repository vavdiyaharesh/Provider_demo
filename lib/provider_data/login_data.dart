import 'package:api_with_provider/models/login_request_model.dart';
import 'package:api_with_provider/models/login_response_model.dart';
import 'package:api_with_provider/service/service.dart';
import 'package:flutter/foundation.dart';

class LoginData with ChangeNotifier{
  Service service=Service();
  String email;
  String password;
  var token;
  LoginResponseModel responseModel;
  LoginRequestModel requestModel;
  
  void editEmail(String email){
    this.email=email;
    notifyListeners();
  }
  void editPassword(String password){
    this.password=password;
    notifyListeners();
  }
  
  logINUser() async {
    responseModel= service.loginData(email, password);
    token=responseModel.token;
    print('${responseModel.token} modalData-------');
    notifyListeners();
    
  }
}