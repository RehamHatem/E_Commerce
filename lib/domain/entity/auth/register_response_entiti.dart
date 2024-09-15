import 'UserEntity.dart';

class RegisterResponseEntiti {
  RegisterResponseEntiti({
      this.message, 
      this.statusmessage,
      this.user,
      this.token,});

  String? message;
  String? statusmessage;
  UserEntity? user;
  String? token;



}