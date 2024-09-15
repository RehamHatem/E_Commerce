import 'package:e_commerce/data/model/response/auth/PhoneError.dart';
import 'package:e_commerce/domain/entity/auth/auth_entity.dart';

import 'User_model.dart';

class RegisterResponseModel {
  RegisterResponseModel({
      this.message, 
      this.statusmessage,
      this.user,
      this.token,this.phoneError});

  RegisterResponseModel.fromJson(dynamic json) {
    message = json['message'];
    statusmessage = json['statusMsg'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
    phoneError = json['errors'] != null ? PhoneError.fromJson(json['errors']) : null;
    token = json['token'];
  }
  String? message;
  String? statusmessage;
  UserModel? user;
  String? token;
  PhoneError? phoneError;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusmessage;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (phoneError != null) {
      map['errors'] = phoneError?.toJson();
    }
    map['token'] = token;
    return map;
  }
  AuthEntity toAuthEntity(){
    return AuthEntity(userEntity: user?.toUserEntity(), token: token);
  }

}