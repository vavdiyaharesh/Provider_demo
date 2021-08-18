import 'package:api_with_provider/models/get_user_model.dart';
import 'package:api_with_provider/service/service.dart'
;import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DeleteList with ChangeNotifier{

   GetUserModel getUserModel;
   List<Datum> userList =[];
   Service service=Service();
   getUser()async{
     getUserModel= await service.getUsers();
     userList.addAll(getUserModel.data);
     print("API-------------- api is loaded");
     notifyListeners();

   }

   deleteUser(int position)async {
      var response=await service.deleteUsers(position,userList[position].id);
      print('${response.statusCode}-this is status code of delete');
      userList.removeAt(position);
      notifyListeners();
   }
}