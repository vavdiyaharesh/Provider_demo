import 'package:api_with_provider/models/update_response_model.dart';
import 'package:api_with_provider/service/service.dart';
import 'package:flutter/foundation.dart';

class UpdateData with ChangeNotifier {
  Service service = Service();
  UpdateResponseModel responseModel;
  String name;
  String job;

  setName(String name) {
    this.name = name;
    notifyListeners();
  }

  setJOb(String job) {
    this.job = job;
    notifyListeners();
  }

  updateUser() async {
    responseModel = await service.updateData(name, job);
    print(responseModel.name);
    notifyListeners();
  }
}
