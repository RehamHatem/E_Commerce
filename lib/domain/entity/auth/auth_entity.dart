import 'package:e_commerce/domain/entity/auth/UserEntity.dart';

class AuthEntity{
  UserEntity? userEntity;
  String? token;
  AuthEntity({required this.userEntity,required this.token});

}