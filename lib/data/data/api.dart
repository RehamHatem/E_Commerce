import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/request/Login_request_model.dart';
import 'package:e_commerce/data/model/request/Register_request_model.dart';
import 'package:e_commerce/data/model/response/auth/Register_response_model.dart';
import 'package:e_commerce/data/model/response/home_tap/brands_response_model.dart';
import 'package:e_commerce/data/model/response/home_tap/category_response_model.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';

import '../model/response/auth/Login_responce_model.dart';
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
      if (connectivityResult != ConnectivityResult.mobile ||
          connectivityResult !=  ConnectivityResult.wifi) {
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

//https://ecommerce.routemisr.com/api/v1/auth/signin
  Future<Either<Failures,LoginResponseModel>>login (String email, String password) async{
    Uri url=Uri.https("ecommerce.routemisr.com","/api/v1/auth/signin");
    var loginRequestModel=LoginRequestModel(email:email,password: password );
    var response= await http.post(url,body: loginRequestModel.toJson());
    var json=jsonDecode(response.body);
    var loginResponseModel= LoginResponseModel.fromJson(json);
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult != ConnectivityResult.mobile ||
        connectivityResult !=  ConnectivityResult.wifi) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return right(loginResponseModel);
      } else {
        return left(ServerError(
            errorMessage: loginResponseModel.phoneError == null
                ? loginResponseModel.message
                : loginResponseModel.phoneError!.msg));
      }
    }
    else {
      return left(NetworkError(errorMessage: "check your internet connection"));
    }
  }


  //https://ecommerce.routemisr.com/api/v1/categories

Future<Either<Failures,CategoryResponseModel>> getCategories() async{

    Uri url=Uri.https("ecommerce.routemisr.com","/api/v1/categories");
    var response= await http.get(url);
    var json=jsonDecode(response.body);
    CategoryResponseModel categoryResponseModel=CategoryResponseModel.fromJson(json);
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult != ConnectivityResult.mobile ||
        connectivityResult !=  ConnectivityResult.wifi) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print(response.body);
        return right(categoryResponseModel);
      }else {
        return left(ServerError(errorMessage: categoryResponseModel.message));
      }
    }else{
      return left (NetworkError(errorMessage: "check your internet" ));
    }
}
//https://ecommerce.routemisr.com/api/v1/brands
Future<Either<Failures,BrandsResponseModel>>getBrands() async{
    Uri url=Uri.https("ecommerce.routemisr.com","/api/v1/brands");
    var response= await http.get(url);
    var json=jsonDecode(response.body);
    var brands=BrandsResponseModel.fromJson(json);
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.mobile ||
        connectivityResult !=  ConnectivityResult.wifi) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print(response.body);
        return right(brands);
      }else {
        return left(ServerError(errorMessage: brands.message));
      }
    }else{
      return left (NetworkError(errorMessage: "check your internet" ));
    }

}
}