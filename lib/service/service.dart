import 'package:api_with_provider/models/get_user_model.dart';
import 'package:api_with_provider/models/login_request_model.dart';
import 'package:api_with_provider/models/login_response_model.dart';
import 'package:api_with_provider/models/post_request_model.dart';
import 'package:api_with_provider/models/post_responce_model.dart';
import 'package:api_with_provider/models/ragester_request_model.dart';
import 'package:api_with_provider/models/register_respose_model.dart';
import 'package:api_with_provider/models/update_request_model.dart';
import 'package:api_with_provider/models/update_response_model.dart';
import 'package:dio/dio.dart';

class Service {
  updateData(String name, String job) async {
    UpdateRequestModel updateDataModel =
        UpdateRequestModel(name: name, job: job);
    var response =
        await Dio().put('https://reqres.in/api/users/2', data: updateDataModel);

    return UpdateResponseModel.fromJson(response.data);
  }

  postData(String name, String job) async {
    PostRequestModel postDataModel = PostRequestModel(name: name, job: job);
    var response =
        await Dio().post('https://reqres.in/api/users', data: postDataModel);

    return PostResponseModel.fromJson(response.data);
  }

  loginData(String email, String password) async {
    LoginRequestModel loginRequestModel =
        LoginRequestModel(email: email, password: password);
    var response = await Dio()
        .post('https://reqres.in/api/login', data: loginRequestModel);
    print('${response.statusCode} statusCode-------');
    return LoginResponseModel.fromJson(response.data);
  }

  getUsers() async {
    var response;
    try {
      response = await Dio().get('https://reqres.in/api/users?page=2');
    } catch (e) {
      print('$e api not called ');
    }
    GetUserModel getUserModel = GetUserModel.fromJson(response.data);
    return getUserModel;
  }

  deleteUsers(int position, int id) async {
    var response;
    try {
      response = await Dio().delete('https://reqres.in/api/users/$id');
    } catch (e) {
      print('$e api not called ');
    }
    return response;
  }

  Future<RegisterResponseModel> registerData(
      String email, String password) async {
    RegisterRequestModel registerData =
        RegisterRequestModel(email: email, password: password);
    var response =
        await Dio().post('https://reqres.in/api/register', data: registerData);
    print("$response -------- get register Data response ");
    return RegisterResponseModel.fromJson(response.data);
  }
}
