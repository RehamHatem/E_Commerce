import 'package:e_commerce/domain/entity/auth_entity.dart';

abstract class RegisterStates{}
class InitState extends RegisterStates{

}
class LoadingState extends RegisterStates{

}
class SuccessState extends RegisterStates{
  AuthEntity authEntity;
  SuccessState({required this.authEntity});

}
class ErrorState extends RegisterStates{
  String? errorMsg;
  ErrorState({required this.errorMsg});

}
