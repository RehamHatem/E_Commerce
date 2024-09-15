 import 'package:e_commerce/domain/entity/auth/auth_entity.dart';

abstract class LoginStates{

}
class InitialState extends LoginStates{

}
class LoadingState extends LoginStates{


}
class ErrorState extends LoginStates{
  String ? errorMsg;
  ErrorState({required this .errorMsg});

}
class SuccessState extends LoginStates{
  AuthEntity ?authEntity;
   SuccessState({required this.authEntity});

}