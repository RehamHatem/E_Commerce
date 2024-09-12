import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/repo/repository/auth_repo.dart';

import '../entity/auth_entity.dart';
import '../entity/failures.dart';

class AuthUseCases{
  AuthRepository authRepository;
  AuthUseCases(this.authRepository);
  Future<Either<Failures, AuthEntity>>invoke(String name,String phone,String password , String email , String confirmPass){
    return authRepository.register(name, phone, password, email, confirmPass);
  }
  Future<Either<Failures, AuthEntity>>login(String email,String password){
    return authRepository.login(email,  password);
  }

}