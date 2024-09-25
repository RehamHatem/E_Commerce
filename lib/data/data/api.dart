import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/request/Login_request_model.dart';
import 'package:e_commerce/data/model/request/Register_request_model.dart';
import 'package:e_commerce/data/model/response/auth/Register_response_model.dart';
import 'package:e_commerce/data/model/response/cart/cart_screen_response_model.dart';
import 'package:e_commerce/data/model/response/cart/remove_from_cart_response_model.dart';
import 'package:e_commerce/data/model/response/cart/update_cart_item_count_response_model.dart';
import 'package:e_commerce/data/model/response/favourite_tap/add_product_to_wish_list_response_model.dart';
import 'package:e_commerce/data/model/response/home_tap/brands_response_model.dart';
import 'package:e_commerce/data/model/response/home_tap/category_response_model.dart';
import 'package:e_commerce/data/model/response/product_tap/add_to_cart_response_model.dart';
import 'package:e_commerce/data/model/response/product_tap/prosuct_response_model.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/ui/view/utils/shared_preference.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';

import '../model/response/auth/Login_responce_model.dart';
class ApiManeger {

  // singilton design pattern
  static ApiManeger? _instance;

  ApiManeger._();

  static ApiManeger instance() {
    _instance ??= ApiManeger._();
    return _instance!;
  }

  //https://ecommerce.routemisr.com/api/v1/auth/signup
  Future<Either<Failures, RegisterResponseModel>> register(String name,
      String phone, String password, String email, String confirmPass) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    try {
      if (connectivityResult != ConnectivityResult.mobile ||
          connectivityResult != ConnectivityResult.wifi) {
        print("i am innnnnnnnnnnnnnnnnnnnnnn");
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
    } catch (e) {
      return left(ServerError(errorMessage: "An error occurred: $e"));
    }
  }

//https://ecommerce.routemisr.com/api/v1/auth/signin
  Future<Either<Failures, LoginResponseModel>> login(String email,
      String password) async {
    Uri url = Uri.https("ecommerce.routemisr.com", "/api/v1/auth/signin");
    var loginRequestModel = LoginRequestModel(email: email, password: password);
    var response = await http.post(url, body: loginRequestModel.toJson());
    var json = jsonDecode(response.body);
    var loginResponseModel = LoginResponseModel.fromJson(json);
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult != ConnectivityResult.mobile ||
        connectivityResult != ConnectivityResult.wifi) {
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

  Future<Either<Failures, CategoryResponseModel>> getCategories() async {
    Uri url = Uri.https("ecommerce.routemisr.com", "/api/v1/categories");
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    CategoryResponseModel categoryResponseModel = CategoryResponseModel
        .fromJson(json);
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult != ConnectivityResult.mobile ||
        connectivityResult != ConnectivityResult.wifi) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print(response.body);
        return right(categoryResponseModel);
      } else {
        return left(ServerError(errorMessage: categoryResponseModel.message));
      }
    } else {
      return left(NetworkError(errorMessage: "check your internet"));
    }
  }

//https://ecommerce.routemisr.com/api/v1/brands
  Future<Either<Failures, BrandsResponseModel>> getBrands() async {
    Uri url = Uri.https("ecommerce.routemisr.com", "/api/v1/brands");
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var brands = BrandsResponseModel.fromJson(json);
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.mobile ||
        connectivityResult != ConnectivityResult.wifi) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print(response.body);
        return right(brands);
      } else {
        return left(ServerError(errorMessage: brands.message));
      }
    } else {
      return left(NetworkError(errorMessage: "check your internet"));
    }
  }


  // https://ecommerce.routemisr.com/api/v1/products

  Future<Either<Failures, ProductResponseModel>> getProducts() async {
    Uri url = Uri.https("ecommerce.routemisr.com", "/api/v1/products");
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var product = ProductResponseModel.fromJson(json);
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.mobile ||
        connectivityResult != ConnectivityResult.wifi) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print(response.body);
        return right(product);
      } else {
        return left(ServerError(errorMessage: product.message));
      }
    } else {
      return left(NetworkError(errorMessage: "check your internet"));
    }
  }

//https://ecommerce.routemisr.com/api/v1/cart
  Future<Either<Failures, AddToCartResponseModel>> addToCart(
      String productId) async {
    Uri url = Uri.https("ecommerce.routemisr.com", "/api/v1/cart");
    var shared = await SharedPreference.init();
    var token = SharedPreference.getData(key: 'Token');
    var response = await http.post(url, body: {'productId': productId},
        headers: {'token': token.toString()});
    var json = jsonDecode(response.body);
    var addToCartResponseModel = AddToCartResponseModel.fromJson(json);
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.mobile ||
        connectivityResult != ConnectivityResult.wifi) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return right(addToCartResponseModel);
      } else if (response.statusCode == 401) {
        return left(
            ServerError(errorMessage: addToCartResponseModel.message));
      }
      else {
        return left(ServerError(errorMessage: addToCartResponseModel.message));
      }
    } else {
      return left(NetworkError(errorMessage: "check your internet connection"));
    }
  }

//https://ecommerce.routemisr.com/api/v1/cart
  Future<Either<Failures, CartScreenResponseModel>> cartProducts() async {
    Uri url = Uri.https("ecommerce.routemisr.com", "/api/v1/cart");
    var shared = await SharedPreference.init();
    var token = SharedPreference.getData(key: 'Token');
    var response = await http.get(url, headers: {
      'token': token.toString()
    });
    var json = jsonDecode(response.body);
    var cartScreenResponseModel = CartScreenResponseModel.fromJson(json);
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.mobile ||
        connectivityResult != ConnectivityResult.wifi) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print(response.body);
        return right(cartScreenResponseModel);
      } else {
        return left(ServerError(errorMessage: cartScreenResponseModel.message));
      }
    } else
      return left(NetworkError(errorMessage: cartScreenResponseModel.message));
  }

//https://ecommerce.routemisr.com/api/v1/cart/6428eb43dc1175abc65ca0b3
  Future<Either<Failures, RemoveFromCartResponseModel>> removeFromCart(
      String productId) async{
    Uri url = Uri.https("ecommerce.routemisr.com", "/api/v1/cart/$productId");
    var shared = await SharedPreference.init();
    var token = SharedPreference.getData(key: 'Token');
    var response = await http.delete(url,headers:{
      'token': token.toString()
    });
    var json=jsonDecode(response.body);
    var removeItem=RemoveFromCartResponseModel.fromJson(json);
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.mobile ||
        connectivityResult != ConnectivityResult.wifi) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print (response.body);
        return right(removeItem);
    }
      else{
        return left(ServerError(errorMessage: removeItem.message));
      }
      }else {
      return left(NetworkError(errorMessage: "please check your internet connection"));
    }
  
  }


 // https://ecommerce.routemisr.com/api/v1/cart/6428e319dc1175abc65ca06d
Future<Either<Failures,UpdateCartItemCountResponseModel>>updateCartItemCount(String productId,int count)async{
    Uri url=Uri.https("ecommerce.routemisr.com","/api/v1/cart/$productId");
    var shared = await SharedPreference.init();
    var token = SharedPreference.getData(key: 'Token');
    var response= await http.put(url,headers: {
      'token': token.toString()
    },body: {
      'count':count.toString()
    });
    var json= jsonDecode(response.body);
    var updateCartItemCountResponseModel=UpdateCartItemCountResponseModel.fromJson(json);
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.mobile ||
        connectivityResult != ConnectivityResult.wifi) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return right(updateCartItemCountResponseModel);

      }
      else{
        return left(ServerError(errorMessage: updateCartItemCountResponseModel.message));
      }
    }else {
      return left(NetworkError(errorMessage: "please check your internet connection"));
    }

}


//https://ecommerce.routemisr.com/api/v1/wishlist

Future<Either<Failures,AddProductToWishListResponseModel>>addProductToWishList(String productId)async{
    Uri url= Uri.https("ecommerce.routemisr.com","/api/v1/wishlist");
    var shared = await SharedPreference.init();
    var token = SharedPreference.getData(key: 'Token');
    var response=await http.post(url,body: {
      'productId':productId
    },headers: {
      'token':token.toString()
    });
    var json=jsonDecode(response.body);
    var addProductToWishList=AddProductToWishListResponseModel.fromJson(json);
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.mobile ||
        connectivityResult != ConnectivityResult.wifi) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print (response.body);
        return right(addProductToWishList);
      }
      else{
        return left(ServerError(errorMessage: addProductToWishList.message));
      }
    }else {
      return left(NetworkError(errorMessage: "please check your internet connection"));
    }

}
}