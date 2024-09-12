import 'package:e_commerce/domain/entity/UserEntity.dart';

class AuthEntity{
  UserEntity? userEntity;
  String? token;
  AuthEntity({required this.userEntity,required this.token});

}