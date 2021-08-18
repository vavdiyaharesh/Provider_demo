import 'package:api_with_provider/models/post_responce_model.dart';
import 'package:api_with_provider/service/service.dart';
import 'package:flutter/foundation.dart';

class PostData with ChangeNotifier {
  Service service = Service();
  PostResponseModel responseModel;
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

  postUser() async {
    responseModel = await service.postData(name, job);
    print(responseModel.name);
    notifyListeners();
  }
}
