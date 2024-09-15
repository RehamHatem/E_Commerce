import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/data/api.dart';
import 'package:e_commerce/domain/entity/auth/auth_entity.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/repo/data_source/auth_data_source.dart';

class AuthDataSourceImpl implements AuthDataSource{
  var apiManeger = ApiManeger.instance();
  AuthDataSourceImpl(this.apiManeger);
  @override
  Future<Either<Failures, AuthEntity>> register(String name, String phone, String password, String email, String confirmPass) async {
   var either= await apiManeger.register(name, phone, password, email, confirmPass);
   return either.fold( (l) {
     return left(l);

   }, (r) {
     return right(r.toAuthEntity());

   },);
  }

  @override
  Future<Either<Failures, AuthEntity>> login(String email, String password) async{
    var either= await apiManeger.login(email, password);
    return either.fold((l) {
      return left(l);

    }, (r) {
      return right(r.toAuthEntity());

    },);
  }
  
}