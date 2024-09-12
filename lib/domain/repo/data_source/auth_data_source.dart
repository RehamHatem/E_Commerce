import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/auth_entity.dart';
import 'package:e_commerce/domain/entity/failures.dart';

abstract class AuthDataSource {
  Future<Either<Failures,AuthEntity>>register(String name,String phone,String password , String email , String confirmPass);
}