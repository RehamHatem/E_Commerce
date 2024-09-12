import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/request/Register_request_model.dart';
import 'package:e_commerce/data/model/response/Register_response_model.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
class ApiManeger{

  // singilton design pattern
  static ApiManeger? _instance;
  ApiManeger._();
  static ApiManeger instance(){
    _instance ??=ApiManeger._();
    return _instance!;
  }
  //https://ecommerce.routemisr.com/api/v1/auth/signup
  Future<Either<Failures,RegisterResponseModel>>register (String name,String phone,String password , String email , String confirmPass)async{
    var connectivityResult = await Connectivity().checkConnectivity();
    try {
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult ==  ConnectivityResult.wifi) {
        print ("i am innnnnnnnnnnnnnnnnnnnnnn");
        Uri url = Uri.https("ecommerce.routemisr.com", "/api/v1/auth/signup");
        var registerRequest = RegisterRequestModel(password: password,
            email: email,
            phone: phone,
            name: name,
            rePassword: confirmPass);
        var response = await http.post(
            url,
            body: registerRequest.toJson());
        var json = jsonDecode(response.body);
        var registerResponseModel = RegisterResponseModel.fromJson(json);
        if (response.statusCode >= 200 && response.statusCode < 300) {
          return right(registerResponseModel);
        } else {
          return left(ServerError(
              errorMessage: registerResponseModel.phoneError == null
                  ? registerResponseModel.message
                  : registerResponseModel.phoneError!.msg));
        }
      }

      else {
        //no internet
        return Left(NetworkError(
            errorMessage: "please check your internet connection"));
      }
    }catch(e){
      return left(ServerError(errorMessage: "An error occurred: $e"));
    }

  }
}