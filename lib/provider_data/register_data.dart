import 'package:api_with_provider/models/register_respose_model.dart';
import 'package:api_with_provider/service/service.dart';
import 'package:flutter/foundation.dart';

class RegisterData with ChangeNotifier {
  Service service = Service();
  RegisterResponseModel responseModel;
  String email;
  String password;

  setEmail(String email) {
    this.email = email;
    notifyListeners();
  }

  setPassword(String password) {
    this.password = password;
    notifyListeners();
  }

  registerUser() async {
     responseModel = (await service.registerData(email, password)) ;

   // print('${responseModel.data} this is data');
   // print('${responseModel.id} this is data');
    notifyListeners();
  }
}
